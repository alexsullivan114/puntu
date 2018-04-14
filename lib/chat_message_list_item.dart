import 'package:chatty_chat_chat/chat_message.dart';
import 'package:chatty_chat_chat/users.dart';
import 'package:flutter/material.dart';

class ChatMessageListItem extends StatelessWidget {

  final ChatMessage _chatMessage;

  ChatMessageListItem(this._chatMessage);

  @override
  Widget build(BuildContext context) {
    Color itemColor = _chatMessage.user == User.A ? Colors.blue : Colors.grey;
    return new Container(
      padding: new EdgeInsets.all(15.0),
      decoration: new BoxDecoration(
          color: itemColor,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.all(new Radius.circular(5.0))
      ),
      child: new Text(
        _chatMessage.message,
        style: new TextStyle(
            color: Colors.white
        ),
      ),
    );
  }
}