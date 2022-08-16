import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:piton_assignment/core/auth/auth_manager.dart';
import 'package:piton_assignment/core/const/service_const.dart';
import 'package:piton_assignment/features/products/model/product_model.dart';
import 'package:piton_assignment/features/products/model/product_detail_model.dart' as pd;

class ProductService {
  Future<List<Product>?> getAllProducts() async {
    var response = await http.get(
        Uri.parse(ServiceConst.baseUrl + ServiceConst.allProduct),
        headers: AuthManager.authHeader);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var productListModel = ProductListModel.fromJson(body);
      return productListModel.products;
    } else {
      var reason = jsonDecode(response.body);
      throw Exception(reason["reason"]);
    }
  }

  Future<pd.Product?> getProductById(String productId) async {
   
    var response = await http.get(
        Uri.parse(ServiceConst.baseUrl + ServiceConst.getProduct + productId),
        headers: AuthManager.authHeader);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var product = pd.ProductDetailModel.fromJson(body).product;
      return product;
    } else {
      var reason = jsonDecode(response.body);
      throw Exception(reason["reason"]);
    }
  }

  Future likeProduct(int productId) async {
    var body = {"productId": productId};
    var response = await http.post(
        Uri.parse(ServiceConst.baseUrl + ServiceConst.likeProduct),
        headers: AuthManager.authHeader,
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      var resBody = jsonDecode(response.body);
      var status = resBody["status"];
      return status;
    } else {
      var reason = jsonDecode(response.body);
      throw Exception(reason["reason"]);
    }
  }

  Future dislikeProduct(int productId) async {
    var body = {"productId": productId};
    var response = await http.post(
        Uri.parse(ServiceConst.baseUrl + ServiceConst.unlikeProduct),
        headers: AuthManager.authHeader,
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      var resBody = jsonDecode(response.body);
      var status = resBody["status"];
      return status;
    } else {
      var reason = jsonDecode(response.body);
      throw Exception(reason["reason"]);
    }
  }
}
