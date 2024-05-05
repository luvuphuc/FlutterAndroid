import 'package:flutter/material.dart';
import 'package:luvuphuc63135096/login/models.dart';
import 'package:luvuphuc63135096/page_home.dart';
import 'package:provider/provider.dart';

class MyLoginPageProvider extends StatelessWidget {
  const MyLoginPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => Login(),
        child: PageLoginProvider(),
      ),
    );
  }
}
class PageLoginProvider extends StatelessWidget {
  const PageLoginProvider({super.key});

  @override
  Widget build(BuildContext context) {
    var c = context.watch<Login>();
    return Scaffold(
      appBar: AppBar(
        title: Text("My login Page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                var appState = context.read<Login>();
                appState.setUsername(value);
              },
              decoration: InputDecoration(
                labelText: 'Username'
              ),
            ),
            TextField(
              onChanged: (value) {
                var appState = context.read<Login>();
                appState.setPassword(value);
              },
              decoration: InputDecoration(
                  labelText: 'Password'
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

