import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Controller1 extends GetxController{
  int _counter = 0;
  int get counter => _counter;
  static Controller1 get(String tag){
    return Get.find(tag: tag);
  }
  void tang1(){
    _counter++;
    update(["01"]);
  }
  void tang2(){
    _counter++;
    update(["02"]);
  }
}

class SimpleStateBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Controller1(),permanent: true, tag: "tag");
  }
}

class SimpleStateHome extends StatelessWidget {
  const SimpleStateHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My simple state home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(PageSimpleState(),binding: SimpleStateBinding());
          },
          child: Text("Simple State"),
        ),
      ),
    );
  }
}


class PageSimpleState extends StatelessWidget {
  PageSimpleState({super.key});
  final c = Get.put(Controller1(),tag: "tag",permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My simple state demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Controller1.get("tag").tang1();
                    },
                    child: Text("+ (01)")
                ),
                GetBuilder(
                    init: Controller1.get("tag"),
                    //tag: "tag",
                    id: "01",
                    builder: (controller) => Text("${controller.counter}"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Controller1.get("tag").tang2();
                    },
                    child: Text("+ (02)")
                ),
                GetBuilder(
                  init: Controller1.get("tag"),
                  //tag: "tag",
                  id: "02",
                  builder: (controller) => Text("${controller.counter}"),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.off(PageNext());
        },
        child: Text("Next"),
      ),
    );
  }
}


class PageNext extends StatelessWidget {
  const PageNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Management"),
      ),
    );
  }
}
