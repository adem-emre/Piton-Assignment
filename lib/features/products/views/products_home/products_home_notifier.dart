import 'package:flutter/cupertino.dart';
import 'package:piton_assignment/core/auth/auth_manager.dart';
import 'package:piton_assignment/core/const/string_const.dart';
import 'package:piton_assignment/features/auth/helper/shared_helper.dart';
import 'package:piton_assignment/features/products/enum/load_state.dart';
import 'package:piton_assignment/features/products/model/product_model.dart';
import 'package:piton_assignment/features/products/service/product_service.dart';

class ProductsHomeNotifier extends ChangeNotifier {
  final ProductService _productService;
  LoadState _loadState = LoadState.idle;
  LoadState get loadState => _loadState;
  String _errorMsg = "";
  String get errorMsg => _errorMsg;
  List<Product> _products = [];
  List<Product> get products => _products;
  ProductsHomeNotifier(this._productService);

  Future getAllProducts() async {
    try {
      _loadState = LoadState.loading;
      var productList = await _productService.getAllProducts();

      if (productList != null) {
        _products = productList;
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

  Future<bool> logout() async {
    try {
      final SharedHelper helper = SharedHelper();
      AuthManager.token = "";
      return await helper.clearAll();
    } catch (e) {
      debugPrint("Logout Error : $e");
      return false;
    }
  }
}
