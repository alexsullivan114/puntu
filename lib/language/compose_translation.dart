import 'package:flutter/material.dart';

class ComposeTranslation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              expands: true,
              minLines: null,
              maxLines: null,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  labelText: "Nepali text",
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
              minLines: null,
              maxLines: null,
              decoration: InputDecoration(
                  labelText: "English text",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(32)),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
            ),
          )
        ],
      ),
    );
  }
}
