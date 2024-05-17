import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luvuphuc63135096/commercial_app/models.dart';
import 'package:luvuphuc63135096/firebase/storage_image_helper.dart';
import 'package:luvuphuc63135096/page_home.dart';

class PageChiTietSPAdmin extends StatefulWidget {
  const PageChiTietSPAdmin({super.key});

  @override
  State<PageChiTietSPAdmin> createState() => _PageChiTietSPAdminState();
}

class _PageChiTietSPAdminState extends State<PageChiTietSPAdmin> {
  XFile? _xFile;
  String? imageurl;
  TextEditingController txtId = TextEditingController();
  TextEditingController txtTen = TextEditingController();
  TextEditingController txtGia = TextEditingController();
  TextEditingController txtMoTa = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Thêm sản phẩm"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: w*0.8,
                  height: w*0.8*2/3,
                  child: _xFile == null ? Icon(Icons.image) : Image.file(File(_xFile!.path)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        _xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                        if(_xFile!= null)
                          setState(() {
        
                          });
                      },
                      child: Text("Chọn ảnh"))
                ],
              ),
              TextField(
                controller: txtId,
                decoration: InputDecoration(
                  labelText: "Id"
                ),
              ),
              TextField(
                controller: txtTen,
                decoration: InputDecoration(
                    labelText: "Tên"
                ),
              ),
              TextField(
                controller: txtGia,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Giá"
                ),
              ),
              TextField(
                controller: txtMoTa,
                decoration: InputDecoration(
                    labelText: "Mô tả"
                ),
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if(_xFile!=null){
                          showMySnackBar(context, "Đang thêm sản phẩm....", 10);
                          imageurl = await uploadImage(
                              imagePath: _xFile!.path,
                              folders: ["fruit_app"],
                              fileName: "${txtId.text}.jpg");
                          if(imageurl !=null){
                            Fruit fruit = Fruit(
                                id: txtId.text,
                                ten: txtTen.text,
                                moTa: txtMoTa.text,
                                anh: imageurl,
                                gia: int.parse(txtGia.text)
                            );
                            FruitSnapshot.them(fruit).then(
                                    (value) => showMySnackBar(
                                        context,
                                        "Thêm thành công sản phẩm: ${txtTen.text}",
                                        3))
                                .catchError((error){
                              showMySnackBar(
                                  context,
                                  "Thêm không thành công sản phẩm: ${txtTen.text}",
                                  3
                              );
                            });
                          }
                        }
                      },
                      child: Text("Thêm"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
