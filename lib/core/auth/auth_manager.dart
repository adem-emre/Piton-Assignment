
import 'package:flutter/cupertino.dart';

class AuthManager{
  static String _token ="";

  static set token (String value) => _token=value;
  static get authHeader => _authHeader;

  static final _authHeader = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  if(_token.isNotEmpty)'access-token':_token
};





}