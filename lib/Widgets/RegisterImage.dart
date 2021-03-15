import 'package:flutter/material.dart';
import 'index.dart';

class RegisterImage extends StatefulWidget {
  @override
  _RegisterImageState createState() => _RegisterImageState();
}

class _RegisterImageState extends State<RegisterImage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> eye1_positiontop;
  Animation<double> eye1_positionright;

  Animation<double> eye2_positiontop;
  Animation<double> eye2_positionright;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    // left eye
    eye1_positionright = Tween<double>(begin: 51, end: 58).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0, 0.3, curve: Curves.easeInCubic)));

    eye1_positiontop = Tween<double>(begin: 34, end: 40).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.3, 0.6, curve: Curves.easeInCubic)));

    // right eye
    eye2_positionright = Tween<double>(begin: 66, end: 59).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0, 0.3, curve: Curves.easeInCubic)));

    eye2_positiontop = Tween<double>(begin: 34, end: 40).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.3, 0.6, curve: Curves.easeInCubic)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
        padding: EdgeInsets.only(top: 40),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/boo2-1.png',
              width: 100,
            ),
            Positioned(
                top: eye1_positiontop.value,
                right: eye1_positionright.value,
                // top: 34,
                // right: 51,
                child: Image.asset(
                  'assets/images/dot.png',
                  width: 15,
                )),
            Positioned(
              top: eye2_positiontop.value,
              left: eye2_positionright.value,
              // top: 34,
              // left: 66,
              child: Image.asset(
                'assets/images/dot.png',
                width: 15,
              ),
            ),
            LeftHand(),
            RightHand()
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: _controller,
    );
  }
}
