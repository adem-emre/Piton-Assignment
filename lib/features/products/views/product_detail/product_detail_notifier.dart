import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:piton_assignment/locator.dart';

import '../../../../core/const/string_const.dart';
import '../../enum/load_state.dart';
import '../../model/product_detail_model.dart';
import '../../service/product_service.dart';

class ProductDetailNotifier extends ChangeNotifier {
  final ProductService _productService = getIt<ProductService>();
  LoadState _loadState = LoadState.idle;

  LoadState get loadState => _loadState;
  String _errorMsg = "";
  String get errorMsg => _errorMsg;
  Product? _productDetail;
  Product? get productDetail => _productDetail;
  

  Future<bool> likeOrUnlike(int productId) async {
    if (productDetail?.likes != null && productDetail!.likes!.isNotEmpty) {
      return await _dislkeProductById(productId);
    } else {
      return await _likeProductById(productId);
    }
  }

  Future<bool> _likeProductById(int productId) async {
    try {
      bool success = await _productService.likeProduct(productId);
      if (success) {
        getProductDetailById(productId);
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<bool> _dislkeProductById(int productId) async {
    try {
      bool success = await _productService.dislikeProduct(productId);
      if (success) {
        getProductDetailById(productId);
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future getProductDetailById(int productId) async {
    try {
      _loadState = LoadState.loading;
      var selectedProduct =
          await _productService.getProductById(productId.toString());

      if (selectedProduct != null) {
        _productDetail = selectedProduct;
        _loadState = LoadState.loaded;
      } else {
        _loadState = LoadState.error;
        _errorMsg = StringConst.errMsg;
      }
    } catch (e) {
      _loadState = LoadState.error;
      _errorMsg = e.toString();
    }
    notifyListeners();
  }
}
