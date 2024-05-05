import 'dart:io';
import 'dart:math';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:luvuphuc63135096/commercial_app/controllers.dart';
import 'package:luvuphuc63135096/commercial_app/models.dart';

class PageChiTietSP extends StatelessWidget {
  Fruit sp;
  PageChiTietSP({required this.sp, super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width*0.9;
    double rating = (Random().nextInt(21))/10+3;
    double rating_person = (Random().nextInt(100)+1000);
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết sản phẩm"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: badges.Badge(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PageGioHangFruit()));
              },
              //badgeContent: Text("${}"),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: w,
                child: Image.network(sp.url ?? "No image"),
              ),
            ),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sp.ten,style: TextStyle(color: Colors.blue,fontSize: 30),),
                Row(
                  children: [
                    Text("${sp.gia}",style: TextStyle(color: Colors.red,fontSize: 20),),
                    SizedBox(width: 10,),
                    Text("${sp.gia*1.8}",style: TextStyle(fontSize:20,decoration: TextDecoration.lineThrough),),
                  ],
                ),
                Text(sp.moTa!),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating:rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Text("${rating}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.red),),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final controller = Get.find<SPController>();
          controller.themvaoGH(sp);
        },
        child: Icon(Icons.add_shopping_cart_outlined, color: Colors.purple,),
      )
    );
  }
}


class PageGioHangFruit extends StatelessWidget {
  const PageGioHangFruit({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
