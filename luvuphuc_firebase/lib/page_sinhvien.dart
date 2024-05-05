

import 'package:flutter/material.dart';
import 'package:luvuphuc_firebase/model.dart';

class PageSinhVien extends StatelessWidget {
  const PageSinhVien({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách sinh viên"),
      ),
      body: StreamBuilder<List<SinhVienSnapshot>>(
        stream: SinhVienSnapshot.getAll(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Center(
              child: Text("Lại lỗi rồi!", style: TextStyle(color: Colors.red),),
            );
          }else
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{// Có data
            var list = snapshot.data!;
            return ListView.separated(
              itemBuilder: (context, index) => ListTile(
                leading: Text("${index + 1}"),
                title: Text("${list[index].sv.ten}"),
              ),
              separatorBuilder: (context, index) => Divider(thickness: 1.5,),
              itemCount: list.length,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CTSV()
            ,));
        },
      ),
    );
  }
}


class CTSV extends StatefulWidget {
  const CTSV({super.key});

  @override
  State<CTSV> createState() => _CTSVState();
}

class _CTSVState extends State<CTSV> {
  var txtId = TextEditingController();
  var txtTen = TextEditingController();
  var txtNgaySinh = TextEditingController();
  var txtQueQuan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin sinh viên"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: txtId,
              decoration: InputDecoration(
                labelText: "id",

              ),
            ),
            TextField(
              controller: txtTen,
              decoration: InputDecoration(
                labelText: "Tên",

              ),
            ),
            TextField(
              controller: txtNgaySinh,
              decoration: InputDecoration(
                labelText: "Ngày Sinh",
              ),
            ),
            TextField(
              controller: txtQueQuan,
              decoration: InputDecoration(
                labelText: "Quê Quán",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      SinhVien sv = SinhVien(
                          id: txtId.text,
                          ngay_sinh: txtNgaySinh.text,
                          que_quan: txtQueQuan.text,
                          ten: txtTen.text
                      );
                      SinhVienSnapshot.addNew(sv);
                    },
                    child: Text("Thêm")
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    txtId.text = "";
    txtTen.text = "";
    txtNgaySinh.text = "";
    txtQueQuan.text = "";
  }
}
