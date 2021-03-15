import 'package:flutter/material.dart';
import 'package:Boo/Widgets/index.dart';

class AddLinkPage extends StatelessWidget {
  final id;
  AddLinkPage({@required this.id});

  var backgroundColor = Color(0xffffffff);
  // var backgroundColor = Colors.orange[200];

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
                  'boo13-1.png',
                  'Add New Category Item',
                  27.0,
                  32.0,
                  29.0,
                  35.0,
                  38.0,
                  33.0,
                ),
                AddNewLinkForm(id: id),
              ],
            ),
          ),
        ));
  }
}
