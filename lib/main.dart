import 'package:chatty_chat_chat/chat/chat_list_screen.dart';
import 'package:chatty_chat_chat/chat/chat_widget.dart';
import 'package:chatty_chat_chat/chat/compose_message_widget.dart';
import 'package:chatty_chat_chat/home/HomeWidget.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MainWidget());

class MainWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: Colors.white
        ),
        home: new Scaffold(
          body: new HomeWidget(),
        )
    );
  }
}
