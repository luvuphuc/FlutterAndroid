import 'package:get/get.dart';

class LoginGetX extends GetxController{
  String _name= "", _password="";
  String get name => _name;
  String get password =>_password;
  setUsername(String text) {
    _name= text;
  }

  setPassword(String text) {
    _password = text;
  }

  bool login() {
    if (name == 'phuc' && password == '12345') return true;
    return false;
  }
}