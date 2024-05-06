import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvuphuc63135096/commercial_app/homepagefruit.dart';
import 'package:luvuphuc63135096/commercial_app/widget_connect_firebase.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MyFirebaseConnect(
      errorMessage: "Lỗi kết nối FireBase",
      connectingMessage: "Đang kết nối....",
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePageFruit(),
      ),
    );
  }
}
