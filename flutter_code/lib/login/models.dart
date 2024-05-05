import 'package:flutter/foundation.dart';

class Login extends ChangeNotifier{
  String _name="", _password="";
  String get name => _name;
  String get password =>_password;
  setUsername(String text){
    _name=text;
    notifyListeners();
  }
  setPassword(String text){
    _password = text;
    notifyListeners();
  }
  bool login() {
    if (_name == 'phuc' && _password == '12345') return true;
    return false;
  }
}
