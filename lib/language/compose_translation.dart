import 'package:chatty_chat_chat/language/word_of_the_day.dart';
import 'package:chatty_chat_chat/language/word_of_the_day_streams.dart';
import 'package:flutter/material.dart';

class ComposeTranslation extends StatelessWidget {
  final TextEditingController _nepaliController = TextEditingController();
  final TextEditingController _englishController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: TextField(
              expands: true,
              maxLines: null,
              textInputAction: TextInputAction.done,
              controller: _nepaliController,
              decoration: InputDecoration(
                  labelText: "Nepali",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(32)),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.done,
              expands: true,
              maxLines: null,
              controller: _englishController,
              decoration: InputDecoration(
                  labelText: "English",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(32)),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: RaisedButton(
                child: Text("Save"),
                onPressed: () {
                  addWordOfTheDay(WordOfTheDay(
                      _nepaliController.text, _englishController.text)
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
