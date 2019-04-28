import 'package:chatty_chat_chat/language/word_of_the_day.dart';
import 'package:chatty_chat_chat/language/word_of_the_day_streams.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

enum FirstDisplayOrder { nepali, english }

class PreviousWordsOfTheDay extends StatefulWidget {
  final FirstDisplayOrder _displayOrder;

  PreviousWordsOfTheDay(this._displayOrder);

  @override
  State createState() {
    return _PreviousWordsOfTheDayState(_displayOrder);
  }
}

class _PreviousWordsOfTheDayState extends State<PreviousWordsOfTheDay> {
  final FirstDisplayOrder _displayOrder;
  List<WordOfTheDay> _words = [];

  _PreviousWordsOfTheDayState(this._displayOrder) {
    subscribeToWordsOfTheDay().listen((wordOfTheday) {
      setState(() {
        _words.add(wordOfTheday);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        children: _words.reversed.map((wordOfTheDay) {
      return _buildListItem(wordOfTheDay);
    }).toList());
  }

  Widget _buildListItem(WordOfTheDay wordOfTheDay) {
    return FadingWordOfTheDay(wordOfTheDay, _displayOrder);
  }
}

class FadingWordOfTheDay extends StatefulWidget {
  final WordOfTheDay _wordOfTheDay;
  final FirstDisplayOrder _displayOrder;

  FadingWordOfTheDay(this._wordOfTheDay, this._displayOrder);

  @override
  State createState() {
    return _FadingWordOfTheDayState(_wordOfTheDay, _displayOrder);
  }
}

class _FadingWordOfTheDayState extends State<FadingWordOfTheDay> {
  final WordOfTheDay _wordOfTheDay;
  final FirstDisplayOrder _displayOrder;
  bool _visible = false;

  _FadingWordOfTheDayState(this._wordOfTheDay, this._displayOrder);

  @override
  Widget build(BuildContext context) {
    String questionText = _displayOrder == FirstDisplayOrder.nepali
        ? _wordOfTheDay.nepaliText
        : _wordOfTheDay.englishText;

    String answerText = _displayOrder == FirstDisplayOrder.nepali
        ? _wordOfTheDay.englishText
        : _wordOfTheDay.nepaliText;

    return Center(
      child: Column(
        children: <Widget>[
          FlatButton(
              child: Text(questionText,
                  style: TextStyle(fontSize: 48.0),
                  textAlign: TextAlign.center),
              onPressed: () {
                setState(() {
                  _visible = true;
                });
              }),
          new AnimatedOpacity(
            child: Text(answerText),
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
