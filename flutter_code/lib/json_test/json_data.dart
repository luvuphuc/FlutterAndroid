import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
class Photo{
  int albumId,id;
  String title, url, thumbnailUrl;
  Photo({required this.albumId, required this.id,required this.title,required this.url,required this.thumbnailUrl});

  Map<String, dynamic> tojson() {
    return {
      'albumId': this.albumId,
      'id': this.id,
      'title': this.title,
      'url': this.url,
      'thumbnailUrl': this.thumbnailUrl,
    };
  }

  factory Photo.fromjson(Map<String, dynamic> map) {
    return Photo(
      albumId: map['albumId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
    );
  }
}
Future<List<Photo>> getHTTP_content() async{
  Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/photos");
  var response = await http.get(uri);
  //print(response.body);
  if(response.statusCode == 200){
    List<dynamic> ds = jsonDecode(response.body) as List;
    return ds.map((photojson) => Photo(
        albumId: photojson["albumId"],
        id: photojson["id"],
        title: photojson["title"],
        url: photojson["url"],
        thumbnailUrl: photojson["thumbnailUrl"])).
    toList();

  }
  return [];
}