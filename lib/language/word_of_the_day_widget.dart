import 'package:chatty_chat_chat/language/compose_word_of_the_day_widget.dart';
import 'package:chatty_chat_chat/language/previous_words_of_the_day.dart';
import 'package:chatty_chat_chat/language/word_of_the_day.dart';
import 'package:chatty_chat_chat/language/word_of_the_day_streams.dart';
import 'package:flutter/material.dart';
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
    return Stack(
      children: <Widget>[
        Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                  child: Text(nepali, style: TextStyle(fontSize: 48.0)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Scaffold(
                          body: PreviousWordsOfTheDay(),
                        );
                      }),
                    );
                  }),
              Text(english),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        Align(
          child: ComposeWordOfTheDayWidget(),
          alignment: Alignment.bottomCenter,
        ),
      ],
    );
  }
}
