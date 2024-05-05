import 'package:flutter/material.dart';
import 'package:luvuphuc63135096/widget/dropdown_button.dart';
import 'package:luvuphuc63135096/widget/radio_button.dart';
import 'package:luvuphuc63135096/widget/wrapper_data.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  StringWrapper monAn = StringWrapper(value: "Pho");
  StringWrapper gioitinh = StringWrapper(value: "Nam");
  StringWrapper nyeu = StringWrapper(value: "Co");
  String? phepTinh = "Cộng";
  List<String> listPhepTinh = ["Cộng", "Trừ", "Nhân", "Chia"];
  String? gt = "Nam";
  DateTime? ngSinh = DateTime(2003, 08, 03);
  int index = 0; //index cua bottom navigationbar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("My Profile"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("asset/images/1.jpg"),
                ),
                  accountName: Text("Luwx Vu Phuc"), 
                  accountEmail: Text("luvuphuc@gmail.com")
              ),
              ListTile(
                leading: Icon(Icons.inbox),
                title: Text("Index"),
                trailing: Text("10"),
              )
            ],
          ),
        ),
        body: _buildBody(context, index),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.mail, color: Colors.blue),
                icon: Icon(Icons.mail, color: Colors.grey),
                label: "Email"
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.home, color: Colors.orange),
                icon: Icon(Icons.home, color: Colors.grey),
                label: "Home"
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.phone, color: Colors.green),
                icon: Icon(Icons.phone, color: Colors.grey),
                label: "Email"
            ),
          ],
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
        )
    );
  }


  _buildBody(BuildContext context, int index) {
    switch (index) {
      case 1 :
        return _buildHome(context);
      case 0 :
        return _buildSMS(context);
      case 2 :
        return _buildPhone(context);
    }
  }

  _buildSMS(BuildContext context) {
    return Center(
        child: Text("Gửi tin nhắn", style: TextStyle(fontSize: 20))
    );
  }

  _buildHome(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 300, height: 200,
                child: Image.asset("asset/images/1.jpg"),
              ),
            ),
            SizedBox(height: 50),
            Text('Họ và tên:',
                style:
                TextStyle(
                    fontSize: 16
                )
            ),
            Text('Lữ Vũ Phúc',
                style:
                TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                )
            ),
            Text('Ngày sinh:', style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Expanded(child: Text(
                    "${ngSinh!.day}/${ngSinh!.month}/${ngSinh!.year}",
                    style: TextStyle(fontSize: 20))),
                IconButton(
                    onPressed: () async {
                      var d = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime.now(),
                      );
                      if (d != null) {
                        setState(() {
                          ngSinh = d;
                        });
                      }
                    },
                    icon: SizedBox(
                        width: 30,
                        child: Icon(Icons.calendar_month_rounded)))
              ],
            ),
            SizedBox(height: 10,),
            Text('Quê quán:', style: TextStyle(fontSize: 16)),
            Text('Nha Trang, Khánh Hòa', style: TextStyle(fontSize: 20)),
            Text('Sở thích:', style: TextStyle(fontSize: 16)),
            Text('Đánh cầu, xem phim',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            SizedBox(height: 10,),
            Text("Gioi tinh", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10,),
            MyRadioButton(groupValue: gioitinh, labels: ["Nam", "Nu"],),
            Text("Ban co nguoi yeu chua"),
            MyRadioButton(groupValue: nyeu, labels: ["Co", "Chua"]),
            // Row(
            //   children: [
            //     Expanded(
            //       child: ListTile(
            //         leading: Radio(
            //           value: "Nam",
            //           groupValue: gt,
            //           onChanged: (value) {
            //             setState(() {
            //               gt = value as String;
            //             });
            //
            //           },
            //         ),
            //         title: Text("Nam"),
            //       ),
            //     ),
            //
            //     Expanded(
            //       child: ListTile(
            //           leading: Radio(
            //             value: "Nữ",
            //             groupValue: gt,
            //             onChanged: (value) {
            //               setState(() {
            //                 gt = value as String;
            //               });
            //
            //             },
            //           ),
            //           title: Text("Nữ"),
            //       ),
            //     )
            //   ],
            // ),
            DropdownButton(
                isExpanded: true,
                value: phepTinh,
                items: listPhepTinh.map(
                        (listPhepTinh) =>
                        DropdownMenuItem(
                          child: Text(listPhepTinh),
                          value: listPhepTinh,
                        )).toList(),
                onChanged: (value) {
                  setState(() {
                    phepTinh = value;
                  });
                }
            ),
            SizedBox(height: 10,),
            Text("Món ăn yêu thích :", style: TextStyle(fontSize: 16),),
            MyDropDownButton(
                buildItem: (label) =>
                    Row(
                      children: [
                        Icon(Icons.food_bank_outlined),
                        SizedBox(width: 30,),
                        Text(label),
                      ],
                    ),
                value: monAn,
                labels: ["Mi goi", "Mi quang", "Pho"]),
          ],
        ),
      ),
    );
  }

  _buildPhone(BuildContext context) {
    return Center(
      child: Text("Dien thoai", style: TextStyle(fontSize: 20)
      ),
    );
  }
}
