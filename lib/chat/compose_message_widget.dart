import 'package:chatty_chat_chat/chat/messaging.dart';
import 'package:flutter/material.dart';

class ComposeMessageWidget extends StatelessWidget {

  final TextEditingController _controller =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
       Container(
          color: Colors.white,
          child:  Padding(
              padding:  EdgeInsets.all(12.0),
              child:  Row(
                  children: <Widget>[
                     Expanded(
                      child:  TextField(
                        controller: _controller,
                      ),
                    ),
                     FloatingActionButton(
                        onPressed: () {
                          sendMessage(_controller.text);
                          _controller.text = "";
                        },
                        mini: true,
                        child:  Icon(Icons.send,
                          color: Colors.white,
                        )
                    ),
                  ]
              )
          )
      );
  }
}