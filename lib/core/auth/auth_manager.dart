
import 'package:flutter/cupertino.dart';

class AuthManager{
  static String token ="";

 
  static get authHeader => _authHeader;

  static final _authHeader = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  if(token.isNotEmpty)'access-token':token
};





}