import 'package:flutter/material.dart';
import 'package:luvuphuc63135096/commercial_app/homepagefruit.dart';
import 'package:luvuphuc63135096/commercial_app/page_dssp_admin.dart';
import 'package:luvuphuc63135096/firebase/page_test_image.dart';
import 'package:luvuphuc63135096/main.dart';
import 'package:luvuphuc63135096/profile/myprofile.dart';
import 'package:luvuphuc63135096/rss/pages/page_rss.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        backgroundColor: Theme.of(context)
          .colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .center,
            children: [
              _buildButton(context,label: "My profile", destination: MyProfile()),
              _buildButton(context,label: "My Home Page Fruit", destination: HomePageFruit()),
              _buildButton(context,label: "RSS APP", destination: RSSApp()),
              _buildButton(context,label: "DSSP App", destination: PageDSSP_Admin()),
              _buildButton(context,label: "PageStorageImage", destination: PageStorageState())
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required String label, required Widget destination}) {
    double w = MediaQuery.of(context).size.width*0.75;
    return Container(
              width: w,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder:(context) => destination,)
                    );
                  },
                  child: Text(label)
              ),
            );
  }
}

showMySnackBar(BuildContext context, String thongBao, int giay){
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(thongBao),
      duration: Duration(seconds: giay),
    )
  );
}