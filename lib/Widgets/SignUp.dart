import 'package:Boo/Services/Services.dart';
import 'package:flutter/material.dart';
import 'package:Boo/Pages/MainPage.dart';
import 'index.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _name;
  String _email;
  String firstPassword;
  String password;

  bool namefill = false;
  bool emailfill = false;
  bool firstPasswordFill = false;
  bool passwordfill = false;

  String errorText;
  Services services = Services();

  @override
  void dispose() {
    super.dispose();
    hand_controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            CustomTextField(
              "name",
              color: Color(0xffE9C224),
              onchange: (String value) {
                setState(() {
                  _name = value;
                  namefill = true;
                });
              },
            ),
            CustomTextField(
              "email",
              type: TextInputType.emailAddress,
              color: Color(0xffE9C224),
              onchange: (String value) {
                setState(() {
                  _email = value;
                  if (RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                      .hasMatch(_email)) {
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
                  firstPassword = value;
                  if (firstPassword.length >= 8) {
                    firstPasswordFill = true;
                  } else {
                    firstPasswordFill = false;
                  }
                });
              },
              onfocus: () {
                hand_controller.isCompleted
                    ? hand_controller.reverse()
                    : hand_controller.forward();
              },
            ),
            CustomTextField(
              "confirm password",
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
                btnChild: Text('Create account'),
                btnColor: Color(0xffE9C224),
                btnWidth: double.infinity,
                btnClick: namefill &&
                        emailfill &&
                        passwordfill &&
                        firstPasswordFill
                    ? () async {
                        if (password != firstPassword) {
                          setState(() {
                            errorText = "confirm password is wrong...";
                          });
                        } else {
                          final res =
                              await services.signup(_name, _email, password);
                          if (res.length != 0) {
                            if (res["data"] == "this email exist") {
                              setState(() {
                                errorText = "this email exist... please login";
                              });
                            } else {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return MainPage();
                              }));
                            }
                          }
                        }
                      }
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
