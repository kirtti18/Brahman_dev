import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:b1/controllers/auth.dart';
import 'package:b1/screens/login.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      await AuthController().isSignedIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.orangeAccent,
      splash: Image.asset(
        "assets/images/b1.png",
      ),
      splashTransition: SplashTransition.sizeTransition,
      splashIconSize: 200,
      duration: 30,
      nextScreen: Login(),
    );
  }
}
