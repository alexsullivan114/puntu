import 'package:chatty_chat_chat/chat/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.message),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) {
                      return new Scaffold(
                        body: new ChatWidget(),
                      );
                    }
                ),
              );
            },
          ),
          new IconButton(
              icon: new Icon(Icons.map),
              onPressed: () {
                // TODO(): Map stuff once the maps API is up and running
              }),

          new IconButton(
              icon: new Icon(Icons.language),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) {
                        return new Scaffold(
                          body: new ChatWidget(),
                        );
                      }
                  ),
                );
              }),
        ],
      ),
    );
  }
}