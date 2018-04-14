import 'package:chatty_chat_chat/chat_message.dart';
import 'package:chatty_chat_chat/compose_message.dart';
import 'package:chatty_chat_chat/message_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white
        ),
        home: new Scaffold(
            body: new Column(
              children: <Widget>[
                new Expanded(
                    child: new MessageList()
                ),
                new ComposeMessage()
              ],
            )
        )
    );
  }
}
