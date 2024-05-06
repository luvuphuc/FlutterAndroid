import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:luvuphuc63135096/commercial_app/models.dart';
import 'package:luvuphuc63135096/commercial_app/widget_connect_firebase.dart';

class FruitStoreAdmin extends StatelessWidget {
  const FruitStoreAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MyFirebaseConnect(
        errorMessage: "Lỗi quài!!!!",
        connectingMessage: "Đang kết nối",
        builder: (context) => PageDSSP_Admin(),
    );
  }
}

class PageDSSP_Admin extends StatelessWidget {
  const PageDSSP_Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DSSP Admin"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<List<FruitSnapshot>>(
          stream: FruitSnapshot.getAll(),
          builder: (context, snapshot) {
            if(snapshot.hasError)
              return Center(child: Text("Lỗi là chuyện bình thường"),);
            if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator(),);
            var list = snapshot.data!;
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(thickness: 1.5,),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var fsn = list[index];
                  return Slidable(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.network(fsn.fruit.anh!)),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Id: ${fsn.fruit.id}"),
                                  Text("Tên: ${fsn.fruit.ten}"),
                                  Text("Giá: ${fsn.fruit.gia}"),
                                  Text("Mô tả: ${fsn.fruit.moTa}"),
                                ],
                              ),
                            ))
                        ],
                      ),
                    endActionPane: ActionPane(
                      extentRatio: 0.6,
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          // An action can be bigger than the others.
                          flex: 2,
                          onPressed: (context) {

                          },
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Cập nhật',
                        ),
                        SlidableAction(
                          flex: 2,
                          onPressed: (context) {

                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Xóa',
                        ),

                      ],
                    ),
                  );
                },);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
