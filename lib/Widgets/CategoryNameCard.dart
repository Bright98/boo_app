import 'package:flutter/material.dart';
import 'package:Boo/Pages/LinksPage.dart';

class CategoryNameCard extends StatelessWidget {
  final size;
  final title;
  final id;
  CategoryNameCard(this.size, {this.title, @required this.id});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size / 2,
        height: size / 3,
        child: Padding(
            padding: EdgeInsets.all(3),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return LinksPage(
                      id: id,
                      title: title,
                    );
                  }));
                },
                child: Card(
                    elevation: 0,
                    color: Color(0xffC1DBE5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            title,
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          )),
                    )))));
  }
}
