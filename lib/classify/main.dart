import 'package:flutter/material.dart';
import 'splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of  interface.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I-feel Analysis',
      home: MySplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
