import 'package:chatty_chat_chat/language/word_of_the_day.dart';
import 'package:chatty_chat_chat/language/word_of_the_day_streams.dart';
import 'package:flutter/widgets.dart';

class WordOfTheDayWidget extends StatefulWidget {

  @override
  _WordOfTheDayState createState() {
    return new _WordOfTheDayState();
  }
}

class _WordOfTheDayState extends State<WordOfTheDayWidget> {

  List<WordOfTheDay> _words = [];

  _WordOfTheDayState() {
    subscribeToWordsOfTheDay().listen((wordOfTheDay) {
      setState(() {
        _words.add(wordOfTheDay);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String nepali = (_words.isEmpty) ? "" : _words.last.nepaliText;
    String english = (_words.isEmpty) ? "" : _words.last.englishText;
    return new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(nepali,
              style: new TextStyle(fontSize: 48.0)
            ),

            new Text(english),
          ],
        )
    );
  }
}