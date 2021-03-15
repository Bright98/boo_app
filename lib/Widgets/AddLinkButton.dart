import 'package:Boo/Pages/AddLinkPage.dart';
import 'package:flutter/material.dart';

class AddLinkButton extends StatefulWidget {
  final id;
  AddLinkButton({@required this.id});

  @override
  _AddLinkButtonState createState() => _AddLinkButtonState();
}

class _AddLinkButtonState extends State<AddLinkButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color(0xffB5D9AE),
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text('Add New'),
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return (AddLinkPage(id: widget.id));
          })).then((value) => setState(() {}));
        },
      ),
    );
  }
}
