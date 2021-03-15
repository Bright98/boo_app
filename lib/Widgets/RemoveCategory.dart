import 'package:Boo/Pages/MainPage.dart';
import 'package:Boo/Services/Services.dart';
import 'package:flutter/material.dart';
import 'index.dart';

class RemoveCategory extends StatefulWidget {
  final id;
  RemoveCategory({@required this.id});

  @override
  _RemoveCategoryState createState() => _RemoveCategoryState();
}

class _RemoveCategoryState extends State<RemoveCategory> {
  Services services = Services();

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      btnChild: Text(
        'Remove',
        style: TextStyle(color: Color(0xff81BC75)),
      ),
      btnColor: Colors.transparent,
      btnClick: () async {
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Are you sure remove this Category?'),
              actions: [
                CustomButton(
                  btnChild: Text('Yes'),
                  btnClick: () async {
                    final res = await services.deleteCategory(widget.id);
                    if (res == true) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return MainPage();
                      }));
                    }
                    // }
                  },
                ),
                CustomButton(
                  btnChild: Text('No'),
                  btnClick: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
