import 'package:flutter/material.dart';

import 'index.dart';

class RegisterButton extends StatefulWidget {
  final registered;
  RegisterButton(this.registered);
  @override
  _RegisterButtonState createState() => _RegisterButtonState(registered);
}

class _RegisterButtonState extends State<RegisterButton> {
  var registered;
  _RegisterButtonState(this.registered);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        btnChild: registered ? Text('login') : Text('signup'),
        btnColor: Colors.transparent,
        btnClick: () {
          setState(() {
            registered = !registered;
            return registered;
          });
        });
  }
}
