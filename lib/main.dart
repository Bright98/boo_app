import 'package:Boo/Pages/ErrorPage.dart';
import 'package:Boo/Services/Services.dart';
import 'package:Boo/Widgets/Loading.dart';
import 'package:Boo/models/Item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/SplashPage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    Services services = Services();
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // if (snapshot.hasError) {
          //   return MaterialApp(
          //     debugShowCheckedModeBanner: false,
          //     theme: ThemeData(fontFamily: 'Nunito'),
          //     home: ErrorPage(),
          //   );
          // }

          if (snapshot.connectionState != ConnectionState.done) {
            return Loading();
          }

          return MultiProvider(
            providers: [
              Provider.value(value: services),
              ChangeNotifierProvider(create: (context) => ItemModel())
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: 'Nunito'),
              home: SplashPage(),
            ),
          );
        });
  }
}
