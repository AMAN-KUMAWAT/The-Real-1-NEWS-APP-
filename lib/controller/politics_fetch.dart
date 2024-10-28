// https://newsapi.org/v2/top-headlines?country=us&apiKey=27644db7324b41cba0ff079a9ac904e5
// https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=27644db7324b41cba0ff079a9ac904e5

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:news_app_con/model/politics_data.dart';

class PoliticsFetch {
  static Future<PoliticsData> fetchNews() async {
    // ignore: unused_local_variable
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=abc-news&apiKey=c9035e4732e44b3abb275b19b414d6b9"));

    // ignore: unused_local_variable
    Map data = jsonDecode(response.body);
    List articles = data["articles"];
    final myElement = Random();
    var myArticle = articles[myElement.nextInt(articles.length)];
    return PoliticsData.fromApiToApp(myArticle);
  }
}
