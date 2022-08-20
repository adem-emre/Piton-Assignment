import 'package:flutter/cupertino.dart';
import 'package:piton_assignment/core/auth/auth_manager.dart';
import 'package:piton_assignment/features/auth/service/login_service.dart';

import '../../../../locator.dart';

class SignUpNotifier extends ChangeNotifier {
  final LoginService _loginService = getIt<LoginService>();
  String userName = "";
  String password = "";
  String mail = "";

  SignUpNotifier();

  Future<bool> signUp() async {
    var token = await _loginService.signUp(userName, password, mail);
    if (token != null) {
      AuthManager.token = token;
      return true;
    }
    return false;
  }
}
