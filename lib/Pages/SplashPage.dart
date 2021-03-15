import 'package:Boo/Pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:Boo/Widgets/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'RegisterPage.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var backgroundColor = Colors.red[100];
    var backgroundColor = Color(0xffffffff);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          width: size.width,
          child: Column(
            children: [
              SplashImg(),
              SplashTitle(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: CustomButton(
                    btnChild: Text(
                      'click to start',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    btnColor: Color(0xff9e0202),
                    btnClick: () async {
                      final store = await SharedPreferences.getInstance();
                      String name = store.getString('name');

                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return name == null ? RegisterPage() : MainPage();
                      }));
                    }),
              ),
              AppVersion()
            ],
          ),
        ),
      ),
    );
  }
}
