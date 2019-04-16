import 'package:chatty_chat_chat/language/word_of_the_day.dart';
import 'package:chatty_chat_chat/language/word_of_the_day_streams.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class PreviousWordsOfTheDay extends StatefulWidget {
  @override
  State createState() {
    return _PreviousWordsOfTheDayState();
  }
}

class _PreviousWordsOfTheDayState extends State<PreviousWordsOfTheDay> {
  List<WordOfTheDay> _words = [];

  _PreviousWordsOfTheDayState() {
    subscribeToWordsOfTheDay().listen((wordOfTheday) {
      setState(() {
        _words.add(wordOfTheday);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(children: _words.reversed.map((wordOfTheDay) {
      return _buildListItem(wordOfTheDay);
    }).toList());
  }

  Widget _buildListItem(WordOfTheDay wordOfTheDay) {
    return FadingWordOfTheDay(wordOfTheDay);
  }
}

class FadingWordOfTheDay extends StatefulWidget {
  final WordOfTheDay _wordOfTheDay;

  FadingWordOfTheDay(this._wordOfTheDay);

  @override
  State createState() {
    return _FadingWordOfTheDayState(_wordOfTheDay);
  }
}

class _FadingWordOfTheDayState extends State<FadingWordOfTheDay> {
  final WordOfTheDay _wordOfTheDay;
  bool _visible = false;

  _FadingWordOfTheDayState(this._wordOfTheDay);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          FlatButton(
              child: Text(
                  _wordOfTheDay.nepaliText, style: TextStyle(fontSize: 48.0), textAlign: TextAlign.center),
              onPressed: () {
                setState(() {
                  _visible = true;
                });
              }),
          new AnimatedOpacity(
            child: Text(_wordOfTheDay.englishText),
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
