import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class NewsContainer extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String newsUrl;
  final String newscnt;
  const NewsContainer(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.newsUrl,
      required this.newscnt});

  Future<void> isValid(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw Exception("Could'nt load Url$newsUrl");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInImage.assetNetwork(
            height: 250,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            placeholder: "assets/images/helper.png",
            image: imageUrl),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 4,
                  title != "--"
                      ? title.length > 40
                          ? "${title.substring(0, 40)}...."
                          : title
                      : title,
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                5.heightBox,
                Text(
                    description != "--"
                        ? description.length > 40
                            ? "${description.substring(0, 30)}..."
                            : description
                        : "${description.substring(0, 80)}...",
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black38)),
                5.heightBox,
                Text(
                    maxLines: 6,
                    newscnt != "--"
                        ? newscnt.length > 200
                            ? newscnt.substring(0, 200)
                            : newscnt
                        : newscnt.substring(0, 20),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ),
        20.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  clipBehavior: Clip.hardEdge,
                  onPressed: () async {
                    isValid(newsUrl);
                  },
                  child: const Text("Read More...")),
            ),
          ],
        ),
        20.heightBox
      ],
    );
  }
}
