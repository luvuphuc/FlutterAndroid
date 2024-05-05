class RssResource{
  String id, name;
  String startDescriptionRegrex,endDescriptionRegrex;
  String startImageRegrex, endImageRegrex;
  Map<String, String> resourceHeaders;

  RssResource({
      required this.id,
      required this.name,
      required this.startDescriptionRegrex,
      required this.endDescriptionRegrex,
      required this.startImageRegrex,
      required this.endImageRegrex,
      required this.resourceHeaders
  });
}
List<RssResource> rssResource = [
  RssResource(id: "vnexpress",
      name:"VN Express",
      startDescriptionRegrex: "</a></br>", endDescriptionRegrex: "",
      startImageRegrex: 'img src="', endImageRegrex: '"',
      resourceHeaders: {
        "Trang chủ":"https://vnexpress.net/rss/tin-moi-nhat.rss",
        "Tin mới nhất":"https://vnexpress.net/rss/tin-moi-nhat.rss",
        "Thế giới":"https://vnexpress.net/rss/the-gioi.rss",
        "Thời sự":"https://vnexpress.net/rss/thoi-su.rss",
        "Pháp luật":"https://vnexpress.net/rss/phap-luat.rss",
        "Thể thao":"https://vnexpress.net/rss/the-thao.rss",
      }),
  RssResource(id: "dantri", name: "Dân trí",
      startDescriptionRegrex: "</a></br>", endDescriptionRegrex: "",
      startImageRegrex: "img src='", endImageRegrex: "'",
      resourceHeaders: {
        "Trang chủ":"https://dantri.com.vn/rss/home.rss",
        "Xã hội":"https://dantri.com.vn/rss/xa-hoi.rss",
        "Pháp luật":"https://dantri.com.vn/rss/phap-luat.rss",
        "Khoa học - Công nghệ":"https://dantri.com.vn/rss/khoa-hoc-cong-nghe.rss",
      })
];