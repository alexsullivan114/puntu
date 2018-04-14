import 'package:chatty_chat_chat/messaging.dart';
import 'package:flutter/material.dart';

class ComposeMessage extends StatelessWidget {

  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      new Container(
          color: Colors.white,
          child: new Padding(
              padding: new EdgeInsets.all(12.0),
              child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new TextField(
                        controller: _controller,
                      ),
                    ),
                    new FloatingActionButton(
                        onPressed: () {
                          sendMessage(_controller.text);
                          _controller.text = "";
                        },
                        mini: true,
                        child: new Icon(Icons.send,
                          color: Colors.white,
                        )
                    ),
                  ]
              )
          )
      );
  }
}