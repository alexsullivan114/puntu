import 'package:chatty_chat_chat/language/word_of_the_day.dart';
import 'package:chatty_chat_chat/language/word_of_the_day_streams.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditTranslationsWidget extends StatefulWidget {
  @override
  State createState() {
    return EditTranslationsState();
  }
}

class EditTranslationsState extends State<EditTranslationsWidget> {
  List<WordOfTheDay> _words = [];

  EditTranslationsState() {
    subscribeToWordsOfTheDay().listen((wordOfTheDay) {
      setState(() {
        _words.add(wordOfTheDay);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _words.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) {
          WordOfTheDay word = _words[index];
          return Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 34),
            child: Row(children: [
              Container(
                  width: 200,
                  child:
                      Text(word.nepaliText, style: TextStyle(fontSize: 24))),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  child: Icon(Icons.edit),
                ),
              ),
              InkWell(
                splashColor: Colors.blue.withAlpha(30),
                child: Icon(Icons.delete),
              )
            ]),
          );
        });
  }
}
