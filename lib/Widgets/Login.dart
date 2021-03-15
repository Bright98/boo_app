import 'package:Boo/Services/Services.dart';
import 'package:flutter/material.dart';
import 'package:Boo/Pages/MainPage.dart';
import 'index.dart';

bool showHands = false;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;
  bool emailfill = false;
  bool passwordfill = false;
  String errorText;
  bool forgetform = false;
  Services services = Services();

  @override
  void dispose() {
    super.dispose();
    hand_controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Form(
        child: Center(
          child: ListView(shrinkWrap: true, children: [
            !forgetform
                ? Column(
                    children: [
                      CustomTextField(
                        "email",
                        type: TextInputType.emailAddress,
                        color: Color(0xffE9C224),
                        onchange: (String value) {
                          setState(() {
                            email = value;
                            if (RegExp(
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                .hasMatch(email)) {
                              emailfill = true;
                            } else {
                              emailfill = false;
                            }
                          });
                        },
                      ),
                      CustomTextField(
                        "password",
                        hideContext: true,
                        color: Color(0xffE9C224),
                        onchange: (String value) {
                          setState(() {
                            password = value;
                            if (password.length >= 8) {
                              passwordfill = true;
                            } else {
                              passwordfill = false;
                            }
                          });
                        },
                        onfocus: () {
                          hand_controller.isCompleted
                              ? hand_controller.reverse()
                              : hand_controller.forward();
                        },
                      ),
                      Center(
                        child: errorText != null
                            ? Text(
                                errorText,
                                style: TextStyle(color: Colors.red),
                              )
                            : Text(''),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: CustomButton(
                          btnChild: Text('Enter'),
                          btnColor: Color(0xffE9C224),
                          btnWidth: double.infinity,
                          btnClick: emailfill && passwordfill
                              ? () async {
                                  final res =
                                      await services.login(email, password);

                                  if (res["data"] == "account not exist") {
                                    setState(() {
                                      errorText =
                                          "you don't have accoun... please signup";
                                    });
                                  } else if (res["data"] ==
                                      "password not correct") {
                                    setState(() {
                                      errorText =
                                          "your password not correct... please try again";
                                    });
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) {
                                        return MainPage();
                                      }),
                                    );
                                  }
                                }
                              : null,
                        ),
                      ),
                    ],
                  )
                : ForgetPass(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  btnChild: !forgetform
                      ? Text(
                          'Forget Password?',
                          style: TextStyle(fontSize: 11),
                        )
                      : Text(
                          'Remember Password?',
                          style: TextStyle(fontSize: 11),
                        ),
                  btnClick: () {
                    setState(() {
                      forgetform = !forgetform;
                    });
                  },
                  btnColor: Colors.transparent,
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
