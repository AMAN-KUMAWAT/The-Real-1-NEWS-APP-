import 'package:flutter/material.dart';
import 'package:news_app_con/views/widgets/bottom.dart';

class Video extends StatelessWidget {
  const Video({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(child: const Center(child: CircularProgressIndicator())),
      bottomNavigationBar: const Bottom(),
    );
  }
}
