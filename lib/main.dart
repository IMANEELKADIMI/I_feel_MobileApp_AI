import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'secondscreen.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),

    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void response(query) async {
    AuthGoogle authGoogle = await AuthGoogle(
        fileJson: "assets/ifile.json")
        .build();
    Dialogflow dialogflow =
    Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
    });
  }

  final messageInsert = TextEditingController();
  List<Map> messsages = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I-feel ChatBot",
        style: TextStyle(color: Color(0xE806805E),fontWeight: FontWeight.bold,fontSize: 30),
        ),
        backgroundColor: Colors.tealAccent[200],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            Divider(
              height: 5.0,
              color: Colors.redAccent,
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                        controller: messageInsert,
                        decoration: InputDecoration.collapsed(
                            hintText: "Text me,tell me how you feel",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0, color:Colors.black87)),
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(

                        icon: Icon(

                          Icons.send,
                          size: 30.0,
                          color: Colors.deepOrange,
                        ),
                        onPressed: () {
                          if (messageInsert.text.isEmpty) {
                            print("empty message");
                          } else {
                            setState(() {
                              messsages.insert(0,
                                  {"data": 1, "message": messageInsert.text});
                            });
                            response(messageInsert.text);
                            messageInsert.clear();
                          }
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  // bubble package in the pubspec.yaml

  Widget chat(String message, int data) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Bubble(
          radius: Radius.circular(15.0),
          color: data == 0 ? Colors.cyan : Colors.pinkAccent,
          elevation: 0.0,
          alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
          nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(
                      data == 0 ? "assets/Bot.png" : "assets/User.png"),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                    child: Text(
                      message,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18.0),
                    ))
              ],
            ),
          )),
    );
  }
}



