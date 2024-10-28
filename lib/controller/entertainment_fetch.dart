// https://newsapi.org/v2/top-headlines?sources=entertainment-weekly&apiKey=070dc616e16a40c58a84724f9796d2e0

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:news_app_con/model/enter.dart';

class EntertainmentFetch {
  static Future<Enter> fetchNews() async {
    // ignore: unused_local_variable
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=entertainment-weekly&apiKey=070dc616e16a40c58a84724f9796d2e0"));

    // ignore: unused_local_variable
    Map data = jsonDecode(response.body);
    List articles = data["articles"];
    final myElement = Random();
    var myArticle = articles[myElement.nextInt(articles.length)];
    return Enter.fromApiToApp(myArticle);
  }
}
