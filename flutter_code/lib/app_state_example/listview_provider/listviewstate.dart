import 'package:flutter/foundation.dart';

class AppGioHangState extends ChangeNotifier{
  List<String> _dssp = [
    "Xoai","Mit","Buoi","Chom chom","Dua"
        "Me","Mit Mit","Buoi Buoi","Chom chom","Dua"
  ];
  List<int> _giohang=[];
  int _soluongmh = 0;
  List<String> get dssp => _dssp;
  List<int> get giohang => _giohang;
  int get soluongmh=> giohang.length;
  themVaoGioHang(int index){
    if(ktraMHTrongGio(index) == false){
      _giohang.add(index);
      notifyListeners();
    }
  }
  bool ktraMHTrongGio(int index){
    for(int i=0;i<giohang.length;i++)
      if(giohang[i] == index)
        return true;
    return false;
  }
  xoaGioHang(int index){
    giohang.remove(index);
    notifyListeners();
  }
}

