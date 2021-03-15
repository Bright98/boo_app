import 'package:Boo/Pages/SplashPage.dart';
import 'package:Boo/Widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Image.asset(
                  'assets/images/boo11.png',
                  width: 100,
                ),
              ),
              Text(
                'Oops...!',
                style: (TextStyle(fontSize: 15)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Something get wrong!',
                  style: (TextStyle(fontSize: 15)),
                ),
              ),
              CustomButton(
                btnChild: Text('Start again'),
                btnClick: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) {
                    return SplashPage();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
