import 'package:flutter/material.dart';

class RegisterTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 30),
      child: Text(
        'First register...',
        style: TextStyle(fontFamily: 'NunitoBold', fontSize: 18),
      ),
    );
  }
}
