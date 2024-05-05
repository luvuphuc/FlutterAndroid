import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvuphuc63135096/login/model_getx.dart';
import 'package:luvuphuc63135096/page_home.dart';

class LoginPageGetX extends StatelessWidget {
  const LoginPageGetX({super.key});

  @override
  Widget build(BuildContext context) {
    var c = Get.put(LoginGetX());
    return Scaffold(
      appBar: AppBar(
        title: Text("My Login Page"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                c.setUsername(value);
              },
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              onChanged: (value) {
                c.setPassword(value);
              },
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  bool check = c.login();
                  if(check){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> PageHome(),));
                  }else {
                    // Nếu đăng nhập thất bại, bạn có thể thực hiện các hành động khác ở đây
                    // Ví dụ: Hiển thị thông báo lỗi
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Login Failed'),
                        content: Text('Invalid username or password.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text("Login")
            )
          ],
        ),
      ),
    );
  }
}
