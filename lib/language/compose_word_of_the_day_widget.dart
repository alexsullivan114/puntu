import 'package:chatty_chat_chat/language/word_of_the_day.dart';
import 'package:chatty_chat_chat/language/word_of_the_day_streams.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ComposeWordOfTheDayWidget extends StatelessWidget {
  final TextEditingController _nepaliController =  TextEditingController();
  final TextEditingController _englishController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Flexible(
          child: Container(
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                   Flexible(
                    child: TextField(
                      decoration:
                           InputDecoration(hintText: "Put dat Nepali here"),
                      controller: _nepaliController,
                    ),
                    fit: FlexFit.loose,
                  ),
                   Flexible(
                    child: TextField(
                      decoration:
                           InputDecoration(hintText: "Put dat english hurr"),
                      controller: _englishController,
                    ),
                    fit: FlexFit.loose,
                  ),
                ],
              ),
              padding:  EdgeInsets.all(8.0)),
        ),
         Padding(
          padding:  EdgeInsets.all(12.0),
          child:  FloatingActionButton(
              onPressed: () {
                addWordOfTheDay( WordOfTheDay(
                    _nepaliController.text, _englishController.text));
              },
              mini: true,
              child:  Icon(Icons.send)),
        )
      ],
    );
  }
}
