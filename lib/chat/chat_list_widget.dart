import 'package:chatty_chat_chat/chat/chat_message.dart';
import 'package:chatty_chat_chat/chat/chat_message_item_widget.dart';
import 'package:chatty_chat_chat/chat/messaging.dart';
import 'package:chatty_chat_chat/users.dart';
import 'package:flutter/material.dart';

class ChatListWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() {
    return new _ChatWidgetState();
  }
}

class _ChatWidgetState extends State<ChatListWidget> {
  List<ChatMessage> _messages = [];

  _ChatWidgetState() {
    subscribeToMessages().listen((chatMessage) {
      setState(() {
        _messages.add(chatMessage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      if (index < _messages.length) {
        return _buildListItem(_messages[index]);
      } else {
        return null;
      }
    });
  }

  Widget _buildListItem(ChatMessage chatMessage) {
    MainAxisAlignment alignment = chatMessage.user == User.Puntu
        ? MainAxisAlignment.start
        : MainAxisAlignment.end;
    return Row(mainAxisAlignment: alignment, children: <Widget>[
      Container(
        padding: EdgeInsets.all(5.0),
        child: ChatMessageListItem(chatMessage),
      )
    ]);
  }
}
