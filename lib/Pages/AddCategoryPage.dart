import 'package:flutter/material.dart';
import 'package:Boo/Widgets/index.dart';

class AddCategoryPage extends StatelessWidget {
  var backgroundColor = Color(0xffffffff);
  // var backgroundColor = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    CustomBackButton(),
                    PageImage(
                      'boo12-1.png',
                      'Add New Category',
                      23.0,
                      28.0,
                      60.0,
                      66.0,
                      36.0,
                      31.0,
                    ),
                    AddNewCategoryForm(),
                  ],
                ))));
  }
}
