import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luvuphuc63135096/commercial_app/widget_connect_firebase.dart';
import 'package:luvuphuc63135096/firebase/storage_image_helper.dart';

class PageStorageState extends StatelessWidget {
  const PageStorageState({super.key});

  @override
  Widget build(BuildContext context) {
    return MyFirebaseConnect(
      errorMessage: "Lỗi kết nối FireBase",
      connectingMessage: "Đang kết nối....",
      builder: (context) =>
          MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(

              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: PageStorageTest(),
          ),
    );
  }
}
class PageStorageTest extends StatefulWidget {
  const PageStorageTest({super.key});

  @override
  State<PageStorageTest> createState() => _PageStorageTestState();
}

class _PageStorageTestState extends State<PageStorageTest> {
  XFile? _xFile;
  String? url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(""),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 300,
              height: 200,
              child: _xFile == null? Icon(Icons.image): Image.file(File(_xFile!.path)),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                _xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                if(_xFile !=null)
                  setState(() {

                  });
              },
              child: Text("Chọn ảnh")
          ),
          ElevatedButton(
              onPressed: () async{
                url = await uploadImage(imagePath: _xFile!.path, folders: ["test"], fileName: "fruit2.jpg");
                if(url != null){
                  setState(() {

                  });
                }
              },
              child:Text("Uploaded")
          ),
          Text(url?? "No url"),
        ],
      ),
    );
  }
}

