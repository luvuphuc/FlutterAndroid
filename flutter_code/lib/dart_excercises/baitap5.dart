import 'dart:math';

Future<int> lateNum(){
  var num = Future.delayed(
    Duration(seconds: 3),
      ()=> Random().nextInt(11),
  );
  return num;
}
void main() async{
  // int num = await lateNum();
  // print(num);
  lateNum().then(
    //value gia tri tra ve cua ham lateNum
          (value) => print(value)
  );
  print("Hello world :3");
}