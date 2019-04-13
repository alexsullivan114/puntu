import 'package:chatty_chat_chat/chat/chat_list_widget.dart';
import 'package:chatty_chat_chat/chat/compose_message_widget.dart';
import 'package:flutter/widgets.dart';

class ChatWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: <Widget>[
           Expanded(
              child:  ChatListWidget()
          ),
           ComposeMessageWidget()
        ]
    );
  }
}