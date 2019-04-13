import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LanguageListItem extends StatelessWidget {
  final Color color;
  final IconData image;
  final GestureTapCallback callback;

  LanguageListItem(this.color, this.image, this.callback);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: callback,
        child: Icon(image),
      ),
    );
  }
}