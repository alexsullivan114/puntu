import 'package:chatty_chat_chat/language/translation.dart';
import 'package:chatty_chat_chat/language/wordoftheday/previous_words_of_the_day.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class FadingWordOfTheDay extends StatefulWidget {
  final Translation _wordOfTheDay;
  final FirstDisplayOrder _displayOrder;
  final VoidCallback _positiveClicked;
  final VoidCallback _negativeClicked;

  FadingWordOfTheDay(this._wordOfTheDay, this._displayOrder,
      this._positiveClicked, this._negativeClicked);

  @override
  State createState() {
    return _FadingWordOfTheDayState(
        _wordOfTheDay, _displayOrder, _positiveClicked, _negativeClicked);
  }
}

class _FadingWordOfTheDayState extends State<FadingWordOfTheDay> {
  final Translation _wordOfTheDay;
  final FirstDisplayOrder _displayOrder;
  final VoidCallback _positiveClicked;
  final VoidCallback _negativeClicked;
  bool _visible = false;

  _FadingWordOfTheDayState(this._wordOfTheDay, this._displayOrder,
      this._positiveClicked, this._negativeClicked);

  @override
  Widget build(BuildContext context) {
    String questionText = _displayOrder == FirstDisplayOrder.nepali
        ? _wordOfTheDay.nepaliText
        : _wordOfTheDay.englishText;

    String answerText = _displayOrder == FirstDisplayOrder.nepali
        ? _wordOfTheDay.englishText
        : _wordOfTheDay.nepaliText;

    return Column(
      children: <Widget>[
        Spacer(),
        FlatButton(
            child: Text(questionText,
                style: TextStyle(fontSize: 48.0), textAlign: TextAlign.center),
            onPressed: () {
              setState(() {
                _visible = true;
              });
            }),
        AnimatedOpacity(
          child: Text(answerText),
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  child: Icon(Icons.check_circle_outline,
                      size: 50, color: Colors.green.shade900),
                  onTap: _positiveClicked),
              SizedBox(width: 50),
              InkWell(
                child: Icon(Icons.cancel, size: 50, color: Colors.red.shade900),
                onTap: _negativeClicked,
              )
            ],
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
