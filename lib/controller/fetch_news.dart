// https://newsapi.org/v2/top-headlines?country=us&apiKey=27644db7324b41cba0ff079a9ac904e5
// https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=27644db7324b41cba0ff079a9ac904e5
//  propo       https://newsapi.org/v2/top-headlines?sources=techradar&apiKey=67a6bfd728a649a0b745f7ad6294ee48
// mahakalj --  https://newsapi.org/v2/top-headlines?sources=bbc-sport&apiKey=c9035e4732e44b3abb275b19b414d6b9
// rg --                  https://newsapi.org/v2/top-headlines?sources=entertainment-weekly&apiKey=070dc616e16a40c58a84724f9796d2e0

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:news_app_con/model/news_article.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

  static Future<NewsArticle> fetchNews() async {
    final element = Random();
    var source = sourcesId[element.nextInt(sourcesId.length)];

    // ignore: unused_local_variable
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$source&apiKey=67a6bfd728a649a0b745f7ad6294ee48"));

    // ignore: unused_local_variable
    Map data = jsonDecode(response.body);
    List articles = data["articles"];
    final myElement = Random();
    var myArticle = articles[myElement.nextInt(articles.length)];
    return NewsArticle.fromApiToApp(myArticle);
  }
}
