import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailView extends StatelessWidget {
  final String newsUrl;
  const DetailView({super.key, required this.newsUrl});

  Future<bool> isValid(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              isValid(newsUrl);
            },
            child: const Text("Read News")),
      ),
    );
  }
}
