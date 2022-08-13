import 'package:flutter/cupertino.dart';
import 'package:piton_assignment/features/auth/helper/shared_helper.dart';

import '../../../../core/auth/auth_manager.dart';
import '../../service/login_service.dart';

class LoginNotifier extends ChangeNotifier{
  bool rememberMeCheckBox = false;
  final LoginService _loginService;
  final SharedHelper _sharedHelper;

  String password = "";
  String mail = "";


  LoginNotifier(this._loginService, this._sharedHelper);

   Future<bool> login() async {
    var token = await _loginService.login(mail,password);
    if (token != null) {
      AuthManager.token = token;
      if(rememberMeCheckBox){
        await  _sharedHelper.setToken(token);
      }
      return true;
    }
    return false;
  }

}