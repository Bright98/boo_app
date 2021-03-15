import 'package:flutter/material.dart';

class LinkTitle extends StatelessWidget {
  final title;
  LinkTitle({@required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: 'NunitoBold', fontSize: 22, color: Color(0xff81BC75)),
        ));
  }
}
