//lop mo ta du lieu
import 'package:cloud_firestore/cloud_firestore.dart';

class Fruit{
  String id;
  String ten;
  String? anh;
  int gia;
  String? moTa;
  Fruit({required this.id,required this.ten, required this.anh, required this.gia,this.moTa});

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'ten': this.ten,
      'anh': this.anh,
      'gia': this.gia,
      'moTa': this.moTa,
    };
  }

  factory Fruit.fromJson(Map<String, dynamic> map) {
    return Fruit(
      id: map['id'] as String,
      ten: map['ten'] as String,
      anh: map['anh'] as String,
      gia: map['gia'] as int,
      moTa: map['moTa'] as String,
    );
  }
}

//lop truy cap du lieu
class FruitSnapshot{
  Fruit fruit;
  DocumentReference ref;

  FruitSnapshot({required this.fruit,required this.ref});
  factory FruitSnapshot.fromMap(DocumentSnapshot docSnap){
    return FruitSnapshot(
      fruit: Fruit.fromJson(docSnap.data() as Map<String, dynamic>),
      ref: docSnap.reference
    );
  }

  static Future<DocumentReference> them(Fruit fruit) async {
    return FirebaseFirestore.instance.collection("Fruits").add(fruit.toJson());
  }
  Future<void> capNhat(Fruit fruit) async{
    return ref.update(fruit.toJson());
  }
  Future<void> xoa() async{
    return ref.delete();
  }
  //truy van theo thoi gian thuc
  static Stream<List<FruitSnapshot>> getAll(){
    Stream<QuerySnapshot> sqs = FirebaseFirestore.instance.collection("Fruits").snapshots();
    return sqs.map(
      (qs) => qs.docs.map(
        (docSnap) => FruitSnapshot.fromMap(docSnap)
      ).toList());
  }
  //truy van du lieu mot lan
  static Future<List<FruitSnapshot>> getAll2() async{
    QuerySnapshot qs = await FirebaseFirestore.instance.collection("Fruits").get();
    return qs.docs.map(
            (docSnap) => FruitSnapshot.fromMap(docSnap)
    ).toList();
  }
}


class GioHangItem{
  Fruit f;
  int soLuong;

  GioHangItem({required this.f,required this.soLuong});
}

Map<String, String> images = {
  "xoai1" : "https://file.hstatic.net/1000302988/article/xo_i-c_t-c_n-gi__975d9a5887a44de184cdf7f697b4ca3b_1024x1024.png",
  "dao1" : "https://media1.nguoiduatin.vn/media/hoang-thi-bich/2022/07/02/dao-tien.jpg",
  "buoi" : "https://vtv1.mediacdn.vn/zoom/640_400/2018/9/30/qua-buoi-crop-15382740582511307278703.jpg",
  "le" : "https://lh3.googleusercontent.com/8yZ4Dy87F7YpolmJGNkgCO7LxyFdX3R8euBBX9lPHVuiXEgiKR9Rf5beRp9yInZnyzNXaNjtyN_uYCl60x75ZPNo3QJNJAS3=rw",
  "man" : "https://ttol.vietnamnetjsc.vn/images/2020/07/10/14/30/man-trung-quoc-1.jpg",
  "vai1" : "https://cafefcdn.com/203337114487263232/2021/6/11/photo-1-16233745066041882362329.jpg",
  "cam" : "https://dt-pro.vn/upload/product/cam-my.jpg",
  "tlong" : "https://bizweb.dktcdn.net/thumb/grande/100/390/808/products/thanh-long-600x600.jpg?v=1600505776873",
  "chanh" : "https://bizweb.dktcdn.net/thumb/grande/100/430/652/products/chanh-vang-3.jpg?v=1626247693937",
  "me" : "https://suckhoedoisong.qltns.mediacdn.vn/Images/haiyen/2017/03/20/nhung-loi-ich-bat-ngo-tu-trai-me1489997444.jpg",
};
class AppData{
  final List<Fruit> _dssp=[
    Fruit(id:"01",ten: "Đào", anh: images["dao"], gia: 23000,moTa: "ĐÀO THẦN TIÊN, ĂN VÀO LÀ THÀNH TIÊN"),
    Fruit(id:"02",ten: "Mận", anh: images["man"], gia: 32000,moTa: "MẬN MÀ SIUUUUUU NGON"),
    Fruit(id:"03",ten: "Lê", anh: images["le"], gia: 35000,moTa:"LÊ ĐƯỜNG SIUUUUU NGỌT"),
    Fruit(id:"04",ten: "Bưởi", anh: images["buoi"], gia: 45000,moTa:"BUOI TO,NGOT"),
    Fruit(id:"05",ten: "Xoài", anh: images["xoai"], gia: 30000,moTa:"XOÀI CHUA LOẠI REP 1-1"),
    Fruit(id:"06",ten: "Vải", anh: images["vai"], gia: 20000,moTa:"VÃI NGON"),
    Fruit(id:"07",ten: "Cam", anh: images["cam"], gia: 35000,moTa:"CAM SIU NGON"),
    Fruit(id:"08",ten: "Thanh long", anh: images["tlong"], gia: 27000,moTa: "THANH LONG NAY NGON"),
    Fruit(id:"09",ten: "Chanh", anh: images["chanh"], gia: 10000,moTa:"CHANH CHUA LAM"),
    Fruit(id:"10",ten: "Me", anh: images["me"], gia: 26000,moTa: "ME BAO CHUA LOẠI GIA"),
  ];
  List<Fruit> get dssp => _dssp;

}