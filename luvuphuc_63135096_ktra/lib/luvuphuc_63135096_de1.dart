import 'package:flutter/material.dart';
import 'package:luvuphuc_63135096_ktra/models.dart';

class PageConvert extends StatefulWidget {
  const PageConvert({super.key});

  @override
  State<PageConvert> createState() => _PageConvertState();
}

class _PageConvertState extends State<PageConvert> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController txtcm = TextEditingController();
  TextEditingController txtinch = TextEditingController();
  double? cm;
  double? inch;
  List<ConvertModel> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lữ Vũ Phúc"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formState,
          child: Column(
            children: [
              TextFormField(
                textAlign: TextAlign.start,
                controller: txtcm,
                keyboardType: TextInputType.number,
                onSaved: (newValue) {
                  cm = double.tryParse(newValue!);
                },
                decoration: InputDecoration(labelText: "Số cm"),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            formState.currentState!.save();
                            if (txtcm.text.isNotEmpty) {
                              setState(() {
                                cm = double.parse(txtcm.text);
                                inch = cm! / 2.54;
                                txtinch.text = inch!.toStringAsFixed(2);
                                list.add(ConvertModel(cm: cm!, inch: inch!));
                              });
                            }
                          }
                        },
                        child: Icon(Icons.arrow_downward),
                      ),
                    ],
                  ),
                  SizedBox(width: 40,),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            formState.currentState!.save();
                            if (txtinch.text.isNotEmpty) {
                              setState(() {
                                inch = double.parse(txtinch.text);
                                cm = inch! * 2.54;
                                txtcm.text = cm!.toStringAsFixed(2);
                                list.add(ConvertModel(cm: cm!, inch: inch!));
                              });
                            }
                          }
                        },
                        child: Icon(Icons.arrow_upward),
                      ),
                    ],
                  ),
                ],
              ),
              TextFormField(
                textAlign: TextAlign.start,
                controller: txtinch,
                keyboardType: TextInputType.number,
                onSaved: (newValue) {
                  inch = double.tryParse(newValue!);
                },
                decoration: InputDecoration(labelText: "Số inch"),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Kết quả chuyển đổi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${list[index].cm} cm = ${list[index].inch} inch'),
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
}
