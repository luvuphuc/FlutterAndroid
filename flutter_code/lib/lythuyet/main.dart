import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvuphuc63135096/app_state_example/listview_provider/giohang_app.dart';
import 'package:luvuphuc63135096/app_state_example/page_counter.dart';
import 'package:luvuphuc63135096/form/page_from_mathang.dart';
import 'package:luvuphuc63135096/getx/get_counter.dart';
import 'package:luvuphuc63135096/json_test/page_test_json.dart';
import 'package:luvuphuc63135096/login/login_page.dart';
import 'package:luvuphuc63135096/login/login_page_getx.dart';
import 'package:luvuphuc63135096/lythuyet/caketest.dart';
import 'package:luvuphuc63135096/lythuyet/imagestest.dart';
import 'package:luvuphuc63135096/lythuyet/listview.dart';
import 'package:luvuphuc63135096/lythuyet/secondroute.dart';
import '../getx/countercontroller.dart';
import '../profile/myprofile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String tet = "Xuân đến rồi";
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? data;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello world"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .center,
          children: [
            _buildButton(context,label: "My Images Test", destination: MyImagesTest()),
            _buildButton(context,label: "Gio Hang", destination: GioHang()),
            _buildButton(context,label: "Chem trai cay", destination: MyListView()),
            _buildButton(context,label: "Form test", destination: PageFromMatHang()),
            _buildButton(context,label: "Banh cua toi", destination: MyCake()),
            _buildButton(context,label: "Provider", destination: CounterStateProvider()),
            _buildButton(context,label: "Get X Example", destination: PageGetXCounter()),
            _buildButton(context,label: "PageSimpleState", destination: SimpleStateHome()),
            _buildButton(context,label: "Page login", destination: MyLoginPageProvider()),
            _buildButton(context,label: "Page login getx", destination: LoginPageGetX()),
            _buildButton(context,label: "Page photo Json", destination: PagePhotoJson()),
            ElevatedButton(onPressed: (){
              setState(() {
                if(tet == "Tết đến rồi")
                  tet = "Hết tết";
                else tet = "Tết đến rồi";
              });
            },
              child: Text(tet),
            ),
            ElevatedButton (onPressed: () async {
              data = await Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondRoute(),));
            }, child: Text(data ?? "Kho co gi`")),
            ElevatedButton(
              child: Text('First Screen'),
              onPressed: () =>
                  Navigator.push(context,MaterialPageRoute(builder: (context) => SecondScreen(),)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required String label, required Widget destination}) {
    double w = MediaQuery.of(context).size.width*0.75;
    return Container(
      width: w,
      child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder:(context) => destination,)
            );
          },
          child: Text(label)
      ),
    );
  }
}
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen'),),
      body: Center(
        child: ElevatedButton(
          child: Text('Second Screen'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
