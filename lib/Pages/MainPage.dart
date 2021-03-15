import 'package:Boo/Services/Services.dart';
import 'package:flutter/material.dart';
import 'package:Boo/Widgets/index.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AddCategoryPage.dart';
import 'ErrorPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // var backgroundColor = Color(0xff92B1BD);
  var backgroundColor = Color(0xffffffff);

  Future<String> getName() async {
    final store = await SharedPreferences.getInstance();
    final name = store.getString('name');
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<Services>(context).getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorPage();
          }

          if (snapshot.connectionState != ConnectionState.done) {
            return Loading(
              color: backgroundColor,
            );
          }

          final category = snapshot.data;

          return Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: FutureBuilder(
                                future: getName(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final data = snapshot.data;
                                    return Text('Hi $data !');
                                  }

                                  return Text('Waiting');
                                },
                              ))
                        ]),
                    PageImage(
                      'boo3-1.png',
                      'Your Categories',
                      24.0,
                      30.0,
                      35.0,
                      41.0,
                      38.0,
                      32.0,
                    ),
                    CategoryList(category: category),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return AddCategoryPage();
                })).then((value) => setState(() {}));
              },
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
              backgroundColor: Color(0xff92B1BD),
            ),
          );
        });
  }
}
