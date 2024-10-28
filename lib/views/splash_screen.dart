// The `SplashScreen` class in Dart is a StatefulWidget that displays a splash screen with an animated image before navigating to the login screen after a delay.
import 'package:flutter/material.dart';
import 'package:news_app_con/views/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToScreen();
  }

  _navigateToScreen() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 4),
          child: Image.asset("assets/images/jhoom.gif"),
        ),
      ),
    );
  }
}
