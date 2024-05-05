

import 'package:cloud_firestore/cloud_firestore.dart';

class SinhVien{
  String id, ngay_sinh, que_quan, ten;


  SinhVien({required this.id, required this.ngay_sinh, required this.que_quan, required this.ten});

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'ngay_sinh': this.ngay_sinh,
      'que_quan': this.que_quan,
      'ten': this.ten,
    };
  }

  factory SinhVien.fromJson(Map<String, dynamic> map) {
    return SinhVien(
      id: map['id'] as String,
      ngay_sinh: map['ngay_sinh'] as String,
      que_quan: map['que_quan'] as String,
      ten: map['ten'] as String,
    );
  }
}

class SinhVienSnapshot{
  SinhVien sv;
  DocumentReference docRef;

  SinhVienSnapshot({required this.sv, required this.docRef,});
  factory SinhVienSnapshot.fromDocSnap(DocumentSnapshot docSnap){
    return SinhVienSnapshot(
        sv: SinhVien.fromJson(docSnap.data() as Map<String, dynamic>),
        docRef: docSnap.reference
    );
  }
  static Future<DocumentReference> addNews(SinhVien sv){
    return FirebaseFirestore.instance.collection("SinhVien").add(sv.toJson());
  }

  static addNew(SinhVien sv){
    return FirebaseFirestore.instance.collection("LuVuPhuc-firebase").add(sv.toJson());
  }
  Future<void> capNhat(SinhVien sv) async{
    docRef.update(sv.toJson());
  }

  static Stream<List<SinhVienSnapshot>> getAll(){
    var querySnapshot = FirebaseFirestore.instance.collection("SinhVien").
    snapshots();
    return querySnapshot.map(
            (qns) => qns.docs.map(
                (docSnap) => SinhVienSnapshot.fromDocSnap(docSnap)
        ).toList());
  }
}






