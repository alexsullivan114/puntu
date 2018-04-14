import 'package:chatty_chat_chat/chat_message.dart';
import 'package:chatty_chat_chat/chat_message_list_item.dart';
import 'package:chatty_chat_chat/messaging.dart';
import 'package:chatty_chat_chat/users.dart';
import 'package:flutter/material.dart';

class MessageList extends StatefulWidget {

  @override
  _MessageListState createState() {
    return new _MessageListState();
  }
}

class _MessageListState extends State<MessageList> {

  List<ChatMessage> messages = [];

  _MessageListState() {
    subscribeToMessages().listen((chatMessage) {
      setState(() {
        messages.add(chatMessage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context, index) {
      if (index < messages.length) {
        return _buildListItem(messages[index]);
      } else {
        return null;
      }
    });
  }

  Widget _buildListItem(ChatMessage chatMessage) {
    MainAxisAlignment alignment = chatMessage.user == User.A ? MainAxisAlignment.start : MainAxisAlignment.end;
    return new Row(
        mainAxisAlignment: alignment,
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(5.0),
            child: new ChatMessageListItem(chatMessage),
          )
        ]
    );
  }
}
