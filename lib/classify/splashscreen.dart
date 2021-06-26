import 'package:flutter/material.dart';
import 'home.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: Home(),
      title: Text(
        'I-feel Analysis',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.yellowAccent,
        ),
      ),
      image: Image.asset('assets/Bot.png'),
      gradientBackground: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.004, 1],
        colors: [
          Color(0xff00ffd9),
          Color(0xfe197c76),
        ],
      ),
    );
  }
}
