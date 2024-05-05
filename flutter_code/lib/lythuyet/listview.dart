import 'dart:math';

import 'package:flutter/material.dart';
List<String> sps = [
  "Xoai","Mit","Buoi","Chom chom","Dua"
  "Me","Mit Mit","Buoi Buoi","Chom chom","Dua"
];
class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chem trai cay")
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.food_bank),
                title: Text(sps[index]),
                subtitle: Text("Trai cay"),
                trailing: Text("${Random().nextInt(100)}.000vnd"),
              ),
            );
          },
          separatorBuilder: (context, index) =>
              Divider(thickness: 1.5),
          itemCount: sps.length),
    );
  }
}
