import 'package:flutter/material.dart';
import 'tensorflow.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tensorflow Lite-Image sentiment',
      home: Tensorflow(),
    );
  }
}
