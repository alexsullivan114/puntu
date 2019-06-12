import 'package:chatty_chat_chat/language/translation.dart';
import 'package:chatty_chat_chat/language/word_streams.dart';
import 'package:flutter/material.dart';

class ComposeTranslation extends StatefulWidget {
  @override
  _ComposeTranslationState createState() => _ComposeTranslationState();
}

class _ComposeTranslationState extends State<ComposeTranslation> {
  TextEditingController _nepaliController = TextEditingController();
  TextEditingController _englishController = TextEditingController();

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
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    _savePressed(context);
                  }),
            ),
          )
        ],
      ),
    );
  }

  void _savePressed(BuildContext context) {
    if (_nepaliController.text?.isNotEmpty == true &&
        _englishController.text?.isNotEmpty == true) {
      addWordOfTheDay(
          Translation(_nepaliController.text, _englishController.text, null));
      SnackBar snackbar = SnackBar(content: Text("New translation saved!"));
      Scaffold.of(context).showSnackBar(snackbar);
      _nepaliController.clear();
      _englishController.clear();
    }
  }
}
