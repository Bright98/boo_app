import 'package:flutter/material.dart';

class LittleEye extends StatefulWidget {
  final begin;
  final end;
  final timeBegin;
  final timeEnd;
  LittleEye(this.begin, this.end, this.timeBegin, this.timeEnd);
  @override
  _LittleEyeState createState() => _LittleEyeState();
}

class _LittleEyeState extends State<LittleEye> with TickerProviderStateMixin {
  AnimationController littleeyecontroller;
  Animation<double> eye;

  @override
  void initState() {
    super.initState();

    littleeyecontroller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    eye = Tween<double>(begin: widget.begin, end: widget.end).animate(
        CurvedAnimation(
            parent: littleeyecontroller,
            curve: Interval(widget.timeBegin, widget.timeEnd,
                curve: Curves.easeInOutCubic)));
  }

  @override
  void dispose() {
    littleeyecontroller.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Positioned(
        top: 17,
        left: eye.value,
        child: Image.asset(
          'assets/images/dot.png',
          width: 6,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: littleeyecontroller,
    );
  }
}
