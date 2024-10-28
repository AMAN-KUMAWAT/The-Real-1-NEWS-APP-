class PoliticsData {
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsCnt;
  String newsUrl;

  PoliticsData(
      {required this.imgUrl,
      required this.newsHead,
      required this.newsDesc,
      required this.newsCnt,
      required this.newsUrl});

  static PoliticsData fromApiToApp(Map<String, dynamic> article) {
    return PoliticsData(
        imgUrl: article["urlToImage"] ??
            "https://t4.ftcdn.net/jpg/02/09/53/11/360_F_209531103_vL5MaF5fWcdpVcXk5yREBk3KMcXE0X7m.jpg",
        newsHead: article["title"] ?? "----",
        newsDesc: article["description"] ?? "----",
        newsCnt: article["content"] ?? "----",
        newsUrl: article["url"] ??
            "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en");
  }
}
