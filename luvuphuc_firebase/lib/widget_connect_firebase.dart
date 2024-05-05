import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
class MyFirebaseconnect extends StatefulWidget {
  final String erroMessage;
  final String connectingMessage;
  final Widget Function(BuildContext context) builder;
  const MyFirebaseconnect({Key? key,
    required this.erroMessage,
    required this.connectingMessage,
    required this.builder});

  @override
  State<MyFirebaseconnect> createState() => _MyFirebaseconnectState();
}

class _MyFirebaseconnectState extends State<MyFirebaseconnect> {
  bool ketNoi = false;
  bool loi = false;
  @override
  Widget build(BuildContext context) {
    if(loi){
      return
        Container(
          color: Colors.white,
          child: Center(
            child: Text(widget.erroMessage,
              style: TextStyle(fontSize: 16, color: Colors.blue ),
              textDirection: TextDirection.ltr,
            ),
          ),
        );
    } else
    if(ketNoi==false){
      return
        Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text(widget.connectingMessage,
                  style: TextStyle(fontSize: 16),
                  textDirection: TextDirection.ltr,
                )
              ],
            ),
          ),
        );
    } else{
      return
        widget.builder(context);
    }
  }
  @override
  void initState(){
    super.initState();
    _khoitaoFireBase();
  }

  _khoitaoFireBase(){
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
        .then((value){
      setState(() {
        ketNoi = true;
      });
    }
    ).catchError((Error){
      setState(() {
        loi = true;
      });
    }).whenComplete(() {
      print("Hoàn tất kết nối FireBase!");
    });
  }
}
