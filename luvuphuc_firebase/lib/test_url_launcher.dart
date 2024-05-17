import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PageUrlLauncher extends StatelessWidget {
  const PageUrlLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _phoneNumberController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Nhập số điện thoại',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                openPhoneDial(_phoneNumberController.text);
              },
              child: Text('Gọi số điện thoại'),
            ),
          ],
        ),
      ),
    );
  }
}
Future<bool> openPhoneDial(String phoneNumber) async{
  bool check = await canLaunch('tel:$phoneNumber');
  if(check ==false) return false;
  else return launch('tel:$phoneNumber');
}