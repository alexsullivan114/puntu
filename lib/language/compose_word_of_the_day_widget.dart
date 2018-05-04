import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ComposeWordOfTheDayWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Flexible(child: TextField()),
            new Flexible(child: TextField())
          ],
        ),
        new FloatingActionButton(onPressed: (){

        },
        mini: true,
        child: new Icon(Icons.send))
      ],
    );
  }
}