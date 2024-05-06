

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:luvuphuc63135096/commercial_app/models.dart';

class SPController extends GetxController{
  final _dssp = <Fruit>[].obs;
  final _gioHang = <GioHangItem>[].obs;
  List<Fruit> get dssp => _dssp.value;
  List<GioHangItem> get gioHang => _gioHang.value;
  int get slmh => gioHang.length;

  @override
  void onReady() {
    super.onReady();
    docDL();
  }

  void themvaoGH(Fruit f){
    gioHang.add(GioHangItem(f: f, soLuong: 1));
    _gioHang.refresh();
  }
  Future<void> docDL() async{
    var list = await FruitSnapshot.getAll2();
    _dssp.value = list.map((fruitSnap) => fruitSnap.fruit).toList();
    _dssp.refresh();
  }
}