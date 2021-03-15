import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final label;
  final hideContext;
  final type;
  final color;
  final onchange;
  final onfocus;
  final key;

  CustomTextField(
    this.label, {
    this.hideContext = false,
    this.type = TextInputType.text,
    this.color = Colors.black,
    this.onchange,
    this.onfocus,
    this.key,
  });
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(widget.onfocus);
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          initialValue: '',
          key: widget.key,
          keyboardType: widget.type,
          obscureText: widget.hideContext,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            labelText: widget.label,
            labelStyle: TextStyle(color: widget.color),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: widget.color, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(width: 1.5, color: widget.color),
            ),
          ),
          onChanged: widget.onchange,
          focusNode: myFocusNode,
        ));
  }
}
