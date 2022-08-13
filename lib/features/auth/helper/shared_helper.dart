import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper{
  final _token = "TOKEN";

  Future<void> setToken(String token)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_token, token);
  }

  Future<String?> getToken()async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }

  Future<void> clearAll()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

}