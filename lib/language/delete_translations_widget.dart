import 'package:chatty_chat_chat/language/word_of_the_day.dart';
import 'package:chatty_chat_chat/language/word_of_the_day_streams.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DeleteTranslationsWidget extends StatefulWidget {
  @override
  State createState() {
    return DeleteTranslationsState();
  }
}

class DeleteTranslationsState extends State<DeleteTranslationsWidget> {
  List<WordOfTheDay> _words = [];

  DeleteTranslationsState() {
    subscribeToWordsOfTheDayList().listen((newWords) {
      setState(() {
        _words = newWords;
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
                  child: Text(word.nepaliText, style: TextStyle(fontSize: 24))),
              Spacer(),
              InkWell(
                onTap: () {
                  deleteWordOfTheDay(word);
                },
                splashColor: Colors.blue.withAlpha(30),
                child: Icon(Icons.delete),
              )
            ]),
          );
        });
  }
}
