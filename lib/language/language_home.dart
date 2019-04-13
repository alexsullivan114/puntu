import 'package:chatty_chat_chat/language/language_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LanguageHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GridView.count(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
        children: <Widget>[
          LanguageListItem(Colors.green, Icons.access_alarm, (){}),
          LanguageListItem(Colors.orange, Icons.accessibility, (){}),
          LanguageListItem(Colors.blue, Icons.add, (){}),
          LanguageListItem(Colors.red, Icons.add_alert, (){}),
          LanguageListItem(Colors.purple, Icons.album, (){}),
          LanguageListItem(Colors.grey, Icons.ac_unit, (){}),
        ],
      ),
    );
  }
}