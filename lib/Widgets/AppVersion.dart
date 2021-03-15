import 'package:flutter/material.dart';

class AppVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'version   1.0.0',
          style: TextStyle(fontSize: 15),
        ));
  }
}
