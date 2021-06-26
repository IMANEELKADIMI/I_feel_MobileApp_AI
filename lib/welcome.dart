import 'package:chatbot_dialogflow/classify/thirdscreen.dart';
import 'package:chatbot_dialogflow/tfl/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'secondscreen.dart';




void main() {
  runApp(MaterialApp( home: MyApp(),
    theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFABE7D4)),
   ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}
class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("I-feel Bot",
            style: TextStyle(color: Color(0xF20D0D0E),fontWeight: FontWeight.w200,fontSize: 60),
          ),
          backgroundColor: Colors.tealAccent[200],
        ),

        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                new Container(

                  child: new Image.asset(
                    "assets/Welcome.jpg",
                    height: 480.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(27),
                  child: new ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      RaisedButton(
                        child: new Text("ChatBot"),
                        color: Colors.redAccent,
                        onPressed: ()  { Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Secondscreen()));
                        },
                      ),
                      RaisedButton(
                        child: Text('Classification'),
                        color: Colors.black38,
                        onPressed: () {Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Thirdscreen()));},
                      ),
                    RaisedButton(
                        child: Text('tflite'),
                        color: Colors.pinkAccent,
                        onPressed: () {Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Screen()));},
                      ),
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}