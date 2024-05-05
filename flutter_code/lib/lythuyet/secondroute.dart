import 'package:flutter/material.dart';
import 'package:luvuphuc63135096/lythuyet/main.dart';

class SecondRoute extends StatelessWidget {
  final String? data; // properties ( khong nen thay doi)
  const SecondRoute({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route")
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp(),));
                } ,
                child: Text(data?? "Khong co gi"))
          ],
        ),
      )
    );
  }
}
