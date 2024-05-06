import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvuphuc63135096/commercial_app/chitietsp.dart';
import 'package:luvuphuc63135096/commercial_app/controllers.dart';
import 'package:luvuphuc63135096/getx/countercontroller.dart';
import 'package:badges/badges.dart' as badges;
class HomePageFruit extends StatelessWidget {
  HomePageFruit({super.key});
  final controller = Get.put(SPController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giải cứu nông sản"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: badges.Badge(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>GioHangFruit(),)
                );
              },
              child: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: GetX<SPController>(
        builder: (controller) {
          return GridView.extent(
              maxCrossAxisExtent: 300,
              children: controller.dssp.map(
                      (sp) => Card(
                        elevation: 1,
                        shadowColor: Colors.blue,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => PageChiTietSP(sp:sp),)
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                  child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(sp.anh!))
                              ),
                              Text("${sp.ten}"),
                              Text("${sp.gia} vnd",style: TextStyle(color: Colors.red),),
                            ],
                          ),
                        ),
                      )
              ).toList()
          );
        },
      ),
    );
  }
}

class GioHangFruit extends StatelessWidget {
  const GioHangFruit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My shoping cart fruit"),
      ),
    );

  }
}

