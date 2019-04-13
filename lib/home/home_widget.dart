import 'package:chatty_chat_chat/chat/chat_widget.dart';
import 'package:chatty_chat_chat/language/language_home.dart';
import 'package:chatty_chat_chat/language/word_of_the_day_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Scaffold(
                    body: ChatWidget(),
                  );
                }),
              );
            },
          ),
          IconButton(
              icon: Icon(Icons.map),
              onPressed: () {
                // TODO(): Map stuff once the maps API is up and running
              }),
          IconButton(
              icon: Icon(Icons.language),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      body: LanguageHome(),
                    );
                  }),
                );
              }),
        ],
      ),
    );
  }
}
