import 'package:Boo/Pages/MainPage.dart';
import 'package:Boo/Services/Services.dart';
import 'package:flutter/material.dart';
import 'index.dart';

class ForgetPass extends StatefulWidget {
  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  int forgetPassStep = 1;
  String password;
  String confirmpassword;
  bool passwordfill = false;
  bool confirmpasswordfill = false;
  String code;
  bool codefill = false;
  String email;
  bool emailfill = false;
  String errorText;
  Services services = Services();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    hand_controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    if (forgetPassStep == 1) {
      return Column(
        children: [
          CustomTextField(
            "email",
            type: TextInputType.emailAddress,
            key: Key('email'),
            color: Color(0xffE9C224),
            onchange: (String value) {
              setState(() {});

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
              btnChild: Text('Send Email'),
              btnColor: Color(0xffE9C224),
              btnWidth: double.infinity,
              btnClick: emailfill
                  ? () async {
                      final res = await services.sendMail(email);
                      if (res["message"] == "account not exist") {
                        setState(() {
                          errorText = "you don't have account... please signup";
                        });
                      } else {
                        setState(() {
                          errorText = '';
                        });
                        forgetPassStep = 2;
                      }
                    }
                  : null,
            ),
          ),
        ],
      );
    } else if (forgetPassStep == 2) {
      return Column(
        children: [
          CustomTextField(
            "confirm code",
            color: Color(0xffE9C224),
            type: TextInputType.number,
            key: Key('code'),
            onchange: (String value) {
              setState(() {});
              setState(() {
                code = value;
                if (code.length >= 6) {
                  codefill = true;
                } else {
                  codefill = false;
                }
              });
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
              btnChild: Text('Send Code'),
              btnColor: Color(0xffE9C224),
              btnWidth: double.infinity,
              btnClick: codefill
                  ? () async {
                      final res = await services.codeConfirm(code);

                      if (res["message"] == "wrong code") {
                        setState(() {
                          errorText = "wrong code...!";
                        });
                      } else {
                        setState(() {
                          errorText = '';
                        });
                        forgetPassStep = 3;
                      }
                    }
                  : null,
            ),
          ),
        ],
      );
    } else if (forgetPassStep == 3) {
      return Column(
        children: [
          CustomTextField(
            "password",
            hideContext: true,
            color: Color(0xffE9C224),
            key: Key('password'),
            onchange: (String value) {
              setState(() {});
              setState(() {
                password = value;
                if (password.length >= 8) {
                  passwordfill = true;
                } else {
                  passwordfill = false;
                }
              });
            },
          ),
          CustomTextField(
            "confirm password",
            hideContext: true,
            color: Color(0xffE9C224),
            key: Key('confirm pass'),
            onchange: (String value) {
              setState(() {
                confirmpassword = value;
                if (confirmpassword.length >= 8) {
                  confirmpasswordfill = true;
                } else {
                  confirmpasswordfill = false;
                }
              });
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
              btnChild: Text('Send New Password'),
              btnColor: Color(0xffE9C224),
              btnWidth: double.infinity,
              btnClick: passwordfill && confirmpasswordfill
                  ? () async {
                      if (password != confirmpassword) {
                        setState(() {
                          errorText = "confirm password is wrong...";
                        });
                      } else {
                        final res = await services.resetPass(password);

                        if (res["data"] == "somethig get wrong") {
                          setState(() {
                            errorText = "sorry...somethig happend wrong";
                          });
                        } else {
                          setState(() {
                            errorText = '';
                          });
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return MainPage();
                          }));
                        }
                      }
                    }
                  : null,
            ),
          ),
        ],
      );
    } else
      return Container();
  }
}
