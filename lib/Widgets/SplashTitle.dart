import 'package:flutter/material.dart';

class SplashTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Text(
          'Save Your Categories!',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30, fontFamily: 'NunitoBold', color: Colors.black),
        ),
      )),
    );
  }
}
