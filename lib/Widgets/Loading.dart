import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final color;
  Loading({this.color});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
