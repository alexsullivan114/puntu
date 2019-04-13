import 'package:chatty_chat_chat/chat/chat_message.dart';
import 'package:chatty_chat_chat/users.dart';
import 'package:flutter/material.dart';

class ChatMessageListItem extends StatelessWidget {

  final ChatMessage _chatMessage;

  ChatMessageListItem(this._chatMessage);

  @override
  Widget build(BuildContext context) {
    Color itemColor = _chatMessage.user == User.Puntu ? Colors.blue : Colors.grey;
    return  Container(
      padding:  EdgeInsets.all(15.0),
      decoration:  BoxDecoration(
          color: itemColor,
          shape: BoxShape.rectangle,
          borderRadius:  BorderRadius.all( Radius.circular(5.0))
      ),
      child:  Text(
        _chatMessage.message,
        style:  TextStyle(
            color: Colors.white
        ),
      ),
    );
  }
}