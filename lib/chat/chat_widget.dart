import 'package:chatty_chat_chat/chat/chat_list_screen.dart';
import 'package:chatty_chat_chat/chat/compose_message_widget.dart';
import 'package:flutter/widgets.dart';

class ChatWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget>[
          new Expanded(
              child: new ChatListWidget()
          ),
          new ComposeMessageWidget()
        ]
    );
  }
}