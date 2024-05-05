import 'package:flutter/material.dart';

class MyImagesTest extends StatelessWidget {

  const MyImagesTest({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("My Image test"),
        actions: [
          IconButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar
                  (SnackBar(
                  content: Text("Share ${nameController.text} với :3"),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: "Đóng",
                    onPressed: (){
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                    },
                  ),
                ));
              },
              icon: Icon(Icons.share))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              Center(
                child: Container(
                    width: 500, height: 300,
                    child: Image.network("https://blogchiasekienthuc.com/wp-content/uploads/2022/11/anh-meme-meo-hai-huoc-27.jpg",
                    )
                ),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Nhập tên vào đây"
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
