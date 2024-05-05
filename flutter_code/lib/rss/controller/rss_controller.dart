import 'package:get/get.dart';
import 'package:luvuphuc63135096/rss/model/rss_resource.dart';
import 'package:http/http.dart' as http;
import '../model/rss_item_template.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:convert';
class SimpleControllerRss extends GetxController{
  List<RssResource> _resource = rssResource;
  RssResource _current = rssResource[0];
  String? rssUrl;
  String? _resourceHeader;
  var _rssList = <RSSItem>[];

  List<RSSItem> get rssList => _rssList;
  String get resourceName => _current.name;
  String? get resourceHeader => _resourceHeader;
  List<String> get headerResources => _current.resourceHeaders.keys.toList();

  static SimpleControllerRss get instance => Get.find<SimpleControllerRss>();

  @override
  void onInit() {
    super.onInit();
    if(rssUrl == null)
      rssUrl = _current.resourceHeaders.values.toList()[0];
    if(_resourceHeader == null)
      _resourceHeader = _current.resourceHeaders.keys.toString()[0];
    _setRegrex();
  }

  @override
  void onReady() {
    super.onReady();
    readRss();
  }

  void _setRegrex(){
    RSSItem.startImageRegrex = _current.startImageRegrex;
    RSSItem.endImageRegrex = _current.endImageRegrex;
    RSSItem.startDescriptionRegrex = _current.startDescriptionRegrex;
    RSSItem.endDescriptionRegrex = _current.endDescriptionRegrex;
  }
  Future<void> readRss() async{
    _fetchRSS(rssUrl!)
      .then((value) {
        _rssList = value?.map((rssMap) => RSSItem.resourceNameOnly(
            rssResourceName: resourceName).getFromJson(rssMap)).toList() ?? [];
        update(["listRss"]);
      },
    ).catchError((error){
        print(error);
      });
  }
  Future<List<dynamic>?> _fetchRSS(String rssUrl) async {
    final response = await http.get(Uri.parse(rssUrl));
    if(response.statusCode ==200){
      //print(response.body);
      final xml2Json = Xml2Json();
      xml2Json.parse(utf8.decode(response.bodyBytes));
      String rssJson = xml2Json.toParker();
      //print(rssJson);
      Map<String, dynamic> jsonData = jsonDecode(rssJson);
      return (jsonData["rss"]["channel"]["item"]);
    }
    return Future.error("Lỗi đọc Rss");
  }
}
class RssBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(SimpleControllerRss());
  }
}