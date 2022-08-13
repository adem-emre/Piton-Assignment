import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:piton_assignment/core/const/service_const.dart';

const _authHeader = {
  'Content-type': 'application/json',
  'Accept': 'application/json'
  
};

class LoginService {
  Future<String?> login(String mail, String password) async {
    var body = {
      "email": mail,
      "password": password,
    };

    final response = await http.post(Uri.parse(ServiceConst.baseUrl+ ServiceConst.login),
        headers: _authHeader, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)["token"];
      return token;
    }
    return null;
  }

  Future<String?> signUp(String userName, String password, String mail) async {
    var body = {"name": userName, "password": password, "email": mail};

    final response = await http.post(Uri.parse(ServiceConst.baseUrl+ServiceConst.register),
        headers: _authHeader, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)["token"];
      return token;
    }
    return null;
  }
}
