import 'package:flutter/material.dart';
import 'index.dart';
import 'dart:math';

class RightHand extends StatefulWidget {
  @override
  _RightHandState createState() => _RightHandState();
}

class _RightHandState extends State<RightHand> with TickerProviderStateMixin {
  Animation<double> hand_opacity;
  Animation<double> hand_scale;
  Animation<double> hand_top;
  Animation<double> hand_left;

  @override
  void initState() {
    super.initState();

    hand_opacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: hand_controller,
        curve: Interval(0, 0.5, curve: Curves.easeInOutCubic)));

    hand_scale = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: hand_controller,
        curve: Interval(0, 0.3, curve: Curves.easeInOutCubic)));

    hand_top = Tween<double>(begin: 35.0, end: 17.0).animate(CurvedAnimation(
        parent: hand_controller,
        curve: Interval(0, 1, curve: Curves.easeInOutCubic)));

    hand_left = Tween<double>(begin: 106.0, end: 98.0).animate(CurvedAnimation(
        parent: hand_controller,
        curve: Interval(0, 1, curve: Curves.easeInOutCubic)));
  }

  @override
  void dispose() {
    hand_controller.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Positioned(
        top: hand_top.value,
        left: hand_left.value,
        child: Opacity(
            opacity: hand_opacity.value,
            child: Transform(
                transform: Matrix4.rotationY(pi),
                child: Transform.rotate(
                    angle: 45,
                    child: Transform.scale(
                        scale: hand_scale.value,
                        child: Image.asset(
                          'assets/images/hand.png',
                          width: 48,
                        ))))));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: hand_controller,
    );
  }
}
