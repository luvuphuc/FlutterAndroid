/*Khai báo lớp SinhVien bao gồm các thuộc tính:
+ id, ten: bắt buộc.
+ ngaySinh, que_Quan: Không bắt buộc*/
// import 'dart:html';

class SinhVien{
  String id, ten;
  String? ngaySinh, queQuan;
  SinhVien({required this.id,required this.ten, this.ngaySinh, this.queQuan});

  @override
  String toString() {
    return 'id: $id, ten: $ten, ngaySinh: $ngaySinh, queQuan: $queQuan';
  }
}
class QLSV{
  List<SinhVien> list = [];
  void add(SinhVien sv){
    list.add(sv);
  }
  void inDS(){
    list.forEach((sv) {
      print(sv.toString());
    });
  }
  void inDS2(){
    for(var sv in list){
      print(sv.toString());
    }
  }
}
void main(){
  SinhVien sv1 = SinhVien(id: "01", ten: "Lu Vu Phuc",ngaySinh: "3/8/2003",queQuan: "Khanh Hoa");
  SinhVien sv2 = SinhVien(id: "02", ten: "Thanh ",ngaySinh: "1/1/2003",queQuan: "Ha Noi");
  print(sv1.toString());
  QLSV qlsv = QLSV();
  qlsv.add(sv1);
  qlsv.add(sv2);
  // qlsv.inDS();
  qlsv.inDS2();
  //Chuyen danh sach cac so nguyen thanh danh sach binh phuong cac so nguyen
  List<int> listInt = [1,2,3,4,5];
  List<int> listBinhPhuong = listInt.map((soNguyen) => soNguyen*soNguyen).toList();
  print(listBinhPhuong);

}