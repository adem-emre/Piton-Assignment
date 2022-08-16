import 'package:flutter/cupertino.dart';

import '../../../../core/const/string_const.dart';
import '../../enum/load_state.dart';
import '../../model/product_detail_model.dart';
import '../../service/product_service.dart';

class ProductDetailNotifier extends ChangeNotifier{
  final ProductService _productService;
  LoadState _loadState = LoadState.idle;

  LoadState get loadState => _loadState;
  String _errorMsg = "";
  String get errorMsg => _errorMsg;
  Product? _productDetail;
  Product? get productDetail => _productDetail;
  ProductDetailNotifier(this._productService);
  

  Future getProductDetailById(int productId) async {
    try {
      _loadState = LoadState.loading;
      var selectedProduct = await _productService.getProductById(productId.toString());

      if (selectedProduct != null) {
        _productDetail= selectedProduct;
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