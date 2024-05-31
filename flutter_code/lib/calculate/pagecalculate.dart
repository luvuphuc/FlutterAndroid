import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:luvuphuc63135096/calculate/models_cal.dart';

class PageCalculate extends StatefulWidget {
  PageCalculate({Key? key}) : super(key: key);

  @override
  _PageCalculateState createState() => _PageCalculateState();
}

class _PageCalculateState extends State<PageCalculate> {
  GlobalKey<FormState> formState = GlobalKey<FormState>(); // Đặt key cho Form

  TextEditingController txtSoaController = TextEditingController();
  TextEditingController txtSobController = TextEditingController();
  int? txtSoa;
  int? txtSob;
  int? sum;
  List<Calculation> calculations = [];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formState, // Sử dụng key đã được đặt
          child: Column(
            children: [
              TextFormField(
                textAlign: TextAlign.end,
                controller: txtSoaController,
                keyboardType: TextInputType.number,
                onSaved: (newValue) {
                  txtSoa = int.tryParse(newValue!);
                },
                validator: (value) => validateField(value),
                decoration: InputDecoration(
                  labelText: "Số a",
                ),
              ),
              TextFormField(
                textAlign: TextAlign.end,
                controller: txtSobController,
                keyboardType: TextInputType.number,
                onSaved: (newValue) {
                  txtSob = int.tryParse(newValue!);
                },
                validator: (value) => validateField(value),
                decoration: InputDecoration(
                  labelText: "Số b",
                ),
              ),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.centerLeft
                  ),
                  onPressed: () {
                    if (formState.currentState!.validate()) {
                      formState.currentState!.save();
                      if (txtSoa != null && txtSob != null) {
                        sum = txtSoa! + txtSob!;
                        setState(() {
                          calculations.add(Calculation(a: txtSoa!, b: txtSob!, result: sum!));
                        });
                      }
                    }
                  },
                  child: Text('Tính tổng'),
                ),
              ),
              Text("${sum ?? 'Hiển thị'}"),
              SizedBox(height: 20),
              Text(
                'Danh sách kết quả:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(

                  itemCount: calculations.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${calculations[index].a} + ${calculations[index].b} = ${calculations[index].result}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập giá trị';
    }
    return null;
  }
}
