import 'package:flutter/material.dart';
import 'package:luvuphuc63135096/json_test/json_data.dart';

class PagePhotoJson extends StatelessWidget {
  const PagePhotoJson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo demo json"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<List<Photo>>(
        future: getHTTP_content(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            return Center(child: Text("Loi roi thang ngu"),);
          if(!snapshot.hasData)
            return Center(child: CircularProgressIndicator(),
            );
          List<Photo> ds = snapshot.data! ;
          return GridView.extent(
            maxCrossAxisExtent: 150,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: ds.map((photo) => Image.network(photo.url)).toList(),
          );
        },
      ),
    );
  }
}
