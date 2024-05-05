class RSSItem{
  static late String startDescriptionRegrex, endDescriptionRegrex;
  static late String startImageRegrex, endImageRegrex;
  String rssResourceName;
  String? title;
  String? pubDate;
  String? description;
  String? link;
  String? imageUrl;

  RSSItem.name({required this.rssResourceName});

  RSSItem.resourceNameOnly({
   required this.rssResourceName
});
  String? _getDescription(String rawDescription){
    int start = rawDescription.indexOf(startDescriptionRegrex)+ startDescriptionRegrex.length;
    if(start >= startDescriptionRegrex.length){
      if(endDescriptionRegrex.length > 0){
        int end = rawDescription.indexOf(endDescriptionRegrex,start);
        return rawDescription.substring(start,end);
      }
      return rawDescription.substring(start);
    }
    return "";
  }
  String? _getImageUrl(String rawDescription){
    int start = rawDescription.indexOf(startImageRegrex) + startImageRegrex.length;
    if(start >= startImageRegrex.length){
      if(endImageRegrex.length>0){
        int end = rawDescription.indexOf(endImageRegrex,start);
        return rawDescription.substring(start,end);
      }
      return rawDescription.substring(start);
    }
    return null;
  }
  RSSItem getFromJson(Map<String,dynamic> json){
    title = json['title'];
    pubDate = json['pubDate'];
    link = json['link'];
    description = _getDescription(json['description']);
    imageUrl = _getImageUrl(json['description']);
    return this;
  }
}
