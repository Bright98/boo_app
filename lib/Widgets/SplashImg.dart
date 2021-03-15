import 'package:flutter/material.dart';

class SplashImg extends StatefulWidget {
  @override
  _SplashImgState createState() => _SplashImgState();
}

class _SplashImgState extends State<SplashImg> with TickerProviderStateMixin {
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
    eye1_positionright = Tween<double>(begin: 59, end: 68).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0, 0.5, curve: Curves.easeInOutCubic)));

    eye1_positiontop = Tween<double>(begin: 31, end: 41).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.5, 1, curve: Curves.easeInOutCubic)));

    // right eye
    eye2_positionright = Tween<double>(begin: 80, end: 71).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0, 0.5, curve: Curves.easeInOutCubic)));

    eye2_positiontop = Tween<double>(begin: 31, end: 41).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.5, 1, curve: Curves.easeInOutCubic)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
        padding: EdgeInsets.all(80),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/boo10-1.png',
              width: 200,
            ),
            Positioned(
                top: eye1_positiontop.value,
                right: eye1_positionright.value,
                child: Image.asset(
                  'assets/images/dot.png',
                  width: 15,
                )),
            Positioned(
              top: eye2_positiontop.value,
              left: eye2_positionright.value,
              // top: 31,
              // left: 80,
              child: Image.asset(
                'assets/images/dot.png',
                width: 15,
              ),
            )
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
