import 'package:chatty_chat_chat/language/word_of_the_day.dart';
import 'package:chatty_chat_chat/language/word_of_the_day_streams.dart';
import 'package:flutter/material.dart';

class ComposeTranslation extends StatefulWidget {
  @override
  _ComposeTranslationState createState() => _ComposeTranslationState();
}

class _ComposeTranslationState extends State<ComposeTranslation> {
  String _nepaliText;
  String _englishText;

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
              onChanged: (newText) {
                setState(() {
                  _nepaliText = newText;
                });
              },
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
              onChanged: (newText) {
                setState(() {
                  _englishText = newText;
                });
              },
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
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: _savePressed(),
              ),
            ),
          )
        ],
      ),
    );
  }

  VoidCallback _savePressed() {
    if (_nepaliText?.isNotEmpty == true && _englishText?.isNotEmpty == true) {
      return () {
        addWordOfTheDay(WordOfTheDay(_nepaliText, _englishText));
      };
    } else {
      return null;
    }
  }
}
