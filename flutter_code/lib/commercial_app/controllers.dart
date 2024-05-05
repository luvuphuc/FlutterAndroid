import 'dart:math';

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
  void onInit() {
    _dssp.value = AppData().dssp;
  }
  void themvaoGH(Fruit f){
    gioHang.add(GioHangItem(f: f, soLuong: 1));
    _gioHang.refresh();
  }

}