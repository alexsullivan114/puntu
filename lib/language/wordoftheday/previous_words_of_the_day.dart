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

class _PreviousWordsOfTheDayState extends State<PreviousWordsOfTheDay>
    with TickerProviderStateMixin {
  final FirstDisplayOrder _displayOrder;
  List<Translation> _words = [];
  PageController _controller = PageController();
  AnimationController _animationController;
  Animation _animation;
  Color _animationColor = Colors.green.shade200;

  _PreviousWordsOfTheDayState(this._displayOrder) {
    subscribeToWordsOfTheDay().listen((wordOfTheday) {
      setState(() {
        _words.add(wordOfTheday);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _controller,
        children: _words.reversed.map((wordOfTheDay) {
          return Stack(
            children: [
              FadeTransition(
                opacity: _animation,
                child: Container(
                  color: _animationColor,
                ),
              ),
              FadingWordOfTheDay(wordOfTheDay, _displayOrder, () {
                _positiveClicked(wordOfTheDay);
              }, () {
                _negativeClicked(wordOfTheDay);
              })
            ],
          );
        }).toList());
  }

  void _positiveClicked(Translation word) {
    setState(() {
      _animationColor = Colors.green.shade200;
    });
    _controller.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    _animationController.forward();
  }

  void _negativeClicked(Translation word) {
    setState(() {
      _animationColor = Colors.red.shade200;
    });
    _controller.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    _animationController.forward();
  }
}
