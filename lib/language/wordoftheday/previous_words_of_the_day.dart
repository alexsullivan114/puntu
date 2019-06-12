import 'package:chatty_chat_chat/language/translation.dart';
import 'package:chatty_chat_chat/language/word_streams.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'fading_word_of_the_day.dart';

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
  List<Translation> _words = [];
  PageController _controller = PageController();

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
        controller: _controller,
        children: _words.reversed.map((wordOfTheDay) {
          return FadingWordOfTheDay(wordOfTheDay, _displayOrder, () {
            _positiveClicked(wordOfTheDay);
          }, () {
            _negativeClicked(wordOfTheDay);
          });
        }).toList());
  }

  void _positiveClicked(Translation word) {
    _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  void _negativeClicked(Translation word) {
    _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
}
