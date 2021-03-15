import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final btnChild;
  final btnColor;
  final btnClick;
  final btnWidth;
  CustomButton({this.btnChild, this.btnColor, this.btnClick, this.btnWidth});
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.btnWidth,
      child: RaisedButton(
        elevation: 0,
        highlightElevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        color: widget.btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: widget.btnChild,
        onPressed: widget.btnClick,
      ),
    );
  }
}
