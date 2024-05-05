import 'package:flutter/material.dart';
import 'package:luvuphuc63135096/app_state_example/listview_provider/listviewstate.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
class GioHang extends StatelessWidget {
  const GioHang({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppGioHangState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GioHangHome(),
      ),
    );
  }
}
class GioHangHome extends StatelessWidget {
  const GioHangHome({super.key});

  @override
  Widget build(BuildContext context) {
    var c = context.watch<AppGioHangState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Store"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: badges.Badge(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> GioHang2()));
              },
              badgeContent: Text("${c.soluongmh}"),
              child: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
            title: Text("${c.dssp[index]}"),
            trailing: IconButton(
              onPressed:() {
                var appState = context.read<AppGioHangState>();
                appState.themVaoGioHang(index);
              },
              icon: c.ktraMHTrongGio(index) == false ?Icon(Icons.add) : Icon(Icons.check),
            ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            thickness:1.5,),
          itemCount: c.dssp.length,
    )
    );
  }
}
//Trang gio hang
class GioHang2 extends StatelessWidget {
  const GioHang2({super.key});

  @override
  Widget build(BuildContext context) {
    var c = context.watch<AppGioHangState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Shopping Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                int itemIndex = c.giohang[index];
                return ListTile(
                  title: Text("${c.dssp[itemIndex]}"),
                  trailing: IconButton(
                    onPressed: () {
                      var appState = context.read<AppGioHangState>();
                      appState.xoaGioHang(itemIndex);
                    },
                    icon: Icon(Icons.remove),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                thickness: 1.5,
              ),
              itemCount: c.giohang.length,

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Tong so tien: "),
                Text("${c.soluongmh * 45000} VND")
              ],
            ),
          )
        ],
      ),
    );
  }
}

