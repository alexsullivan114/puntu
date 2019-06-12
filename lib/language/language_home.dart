import 'package:chatty_chat_chat/language/language_list_item.dart';
import 'package:chatty_chat_chat/language/previous_words_of_the_day.dart';
import 'package:chatty_chat_chat/language/word_of_the_day_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'compose_translation.dart';
import 'delete_translations_widget.dart';

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
          LanguageListItem(Colors.green, Icons.access_alarm, () {
            showPage(context, PreviousWordsOfTheDay(FirstDisplayOrder.english));
          }),
          LanguageListItem(Colors.orange, Icons.edit, () {
            showPage(context, DeleteTranslationsWidget());
          }),
          LanguageListItem(Colors.blue, Icons.add, () {
            showPage(context, ComposeTranslation());
          }),
          LanguageListItem(Colors.red, Icons.add_alert, () {}),
          LanguageListItem(Colors.purple, Icons.album, () {}),
          LanguageListItem(Colors.grey, Icons.ac_unit, () {}),
        ],
      ),
    );
  }

  void showPage(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Scaffold(
          body: SafeArea(child: widget),
        );
      }),
    );
  }
}
