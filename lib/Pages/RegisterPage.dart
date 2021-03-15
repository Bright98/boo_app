import 'package:flutter/material.dart';
import 'package:Boo/Widgets/index.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var registered = true;
  var btnText;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final keyboard = MediaQuery.of(context).viewInsets.bottom;
    var backgroundColor = Color(0xffffffff);
    // var backgroundColor = Colors.amber[200];

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            child: Container(
          width: size.width,
          child: Column(
            children: [
              RegisterImage(),
              RegisterTitle(),
              Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: registered ? Login() : SignUp())),
                      keyboard == 0
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: CustomButton(
                                  btnChild: registered
                                      ? Text("Don't Have Account?")
                                      : Text('Have Account?'),
                                  btnColor: Colors.transparent,
                                  btnClick: () {
                                    setState(() {
                                      registered = !registered;
                                    });
                                  }),
                            )
                          : Container()
                    ],
                  ))
            ],
          ),
        )));
  }
}
