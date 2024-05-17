import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luvuphuc63135096/commercial_app/models.dart';
import 'package:luvuphuc63135096/firebase/storage_image_helper.dart';
import 'package:luvuphuc63135096/page_home.dart';

class PageCapNhatSPAdmin extends StatefulWidget {
  FruitSnapshot fruitSnapshot;
  PageCapNhatSPAdmin({required this.fruitSnapshot,super.key});

  @override
  State<PageCapNhatSPAdmin> createState() => _PageCapNhatSPAdminState();
}

class _PageCapNhatSPAdminState extends State<PageCapNhatSPAdmin> {
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
        title: Text("Cập nhật sản phẩm"),
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
                  child: _xFile == null ? Image.network(widget.fruitSnapshot.fruit.anh!) : Image.file(File(_xFile!.path)),
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
                        Fruit fruit = Fruit(
                            id: txtId.text,
                            ten: txtTen.text,
                            moTa: txtMoTa.text,
                            anh: imageurl,
                            gia: int.parse(txtGia.text)
                        );
                        if(_xFile!=null){
                          showMySnackBar(context, "Đang cập nhật sản phẩm....", 10);
                          imageurl = await uploadImage(
                              imagePath: _xFile!.path,
                              folders: ["fruit_app"],
                              fileName: "${txtId.text}.jpg");
                          if(imageurl !=null){
                            fruit.anh = imageurl;
                            _capNhatSP(fruit);
                          }else{
                            showMySnackBar(context, "Đang cập nhật sản phẩm....", 10);
                            fruit.anh = widget.fruitSnapshot.fruit.anh;
                            _capNhatSP(fruit);
                          }
                        }
                      },
                      child: Text("Cập nhật"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  _capNhatSP(Fruit fruit){
    widget.fruitSnapshot.capNhat(fruit).then(
            (value) => showMySnackBar(
            context,
            "Cập nhật thành công sản phẩm: ${txtTen.text}",
            3)
    ).catchError((error){
      showMySnackBar(
          context,
          "Cập nhật không thành công sản phẩm: ${txtTen.text}",
          3
      );
    });
  }
  @override
  void initState() {
    txtId.text = widget.fruitSnapshot.fruit.id;
    txtTen.text = widget.fruitSnapshot.fruit.ten;
    txtGia.text = widget.fruitSnapshot.fruit.gia.toString();
    txtMoTa.text = widget.fruitSnapshot.fruit.moTa?? "";

  }
}
