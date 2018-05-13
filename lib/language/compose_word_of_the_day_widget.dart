import 'package:chatty_chat_chat/language/word_of_the_day.dart';
import 'package:chatty_chat_chat/language/word_of_the_day_streams.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ComposeWordOfTheDayWidget extends StatelessWidget {
  final TextEditingController _nepaliController = new TextEditingController();
  final TextEditingController _englishController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Flexible(
          child: new Container(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Flexible(
                    child: TextField(
                      decoration:
                          new InputDecoration(hintText: "Put dat Nepali here"),
                      controller: _nepaliController,
                    ),
                    fit: FlexFit.loose,
                  ),
                  new Flexible(
                    child: TextField(
                      decoration:
                          new InputDecoration(hintText: "Put dat english hurr"),
                      controller: _englishController,
                    ),
                    fit: FlexFit.loose,
                  ),
                ],
              ),
              padding: new EdgeInsets.all(8.0)),
        ),
        new FloatingActionButton(
            onPressed: () {
              addWordOfTheDay(new WordOfTheDay(
                  _nepaliController.text, _englishController.text));
            },
            mini: true,
            child: new Icon(Icons.send))
      ],
    );
  }
}
