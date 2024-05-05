import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvuphuc63135096/rss/controller/rss_controller.dart';
import 'package:luvuphuc63135096/rss/pages/webview.dart';

class RSSApp extends StatelessWidget {
  const RSSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: RssBindings(),
      home: PageRssSimple(),
    );
  }
}
class PageRssSimple extends StatelessWidget {
  const PageRssSimple({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<SimpleControllerRss>(
          id: "resource_name",
          init: SimpleControllerRss.instance,
          builder: (controller) => Text(controller.resourceName),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<SimpleControllerRss>(
          id: "listRss",
          init: SimpleControllerRss.instance,
          builder: (controller) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyWebPage(url: controller.rssList[index].link?? ""),)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Image.network(controller.rssList[index].imageUrl?? "")),
                            SizedBox(width: 10,),
                            Expanded(
                                flex: 2,
                                child: Text(controller.rssList[index].title?? "",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 18
                                ),))
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(controller.rssList[index].description ?? ""),
                      ],
                  );
                },
                separatorBuilder: (context, index) => Divider(thickness: 1.5,),
                itemCount: controller.rssList.length,
            );
          } ,
        ),
      ),
    );
  }
}

