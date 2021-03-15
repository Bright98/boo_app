import 'package:flutter/material.dart';

class PageImage extends StatefulWidget {
  final image;
  final title;
  final eye1_positionright_begin;
  final eye1_positionright_end;
  final eye_positiontop_begin;
  final eye_positiontop_end;
  final eye2_positionright_begin;
  final eye2_positionright_end;

  PageImage(
      this.image,
      this.title,
      this.eye1_positionright_begin,
      this.eye1_positionright_end,
      this.eye_positiontop_begin,
      this.eye_positiontop_end,
      this.eye2_positionright_begin,
      this.eye2_positionright_end);

  @override
  _PageImageState createState() => _PageImageState();
}

class _PageImageState extends State<PageImage> with TickerProviderStateMixin {
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
    eye1_positionright = Tween<double>(
            begin: widget.eye1_positionright_begin,
            end: widget.eye1_positionright_end)
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0, 0.5, curve: Curves.easeInOutCubic)));

    eye1_positiontop = Tween<double>(
            begin: widget.eye_positiontop_begin,
            end: widget.eye_positiontop_end)
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.5, 1, curve: Curves.easeInOutCubic)));

    // right eye
    eye2_positionright = Tween<double>(
            begin: widget.eye2_positionright_begin,
            end: widget.eye2_positionright_end)
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0, 0.5, curve: Curves.easeInOutCubic)));

    eye2_positiontop = Tween<double>(
            begin: widget.eye_positiontop_begin,
            end: widget.eye_positiontop_end)
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.5, 1, curve: Curves.easeInOutCubic)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    var img = widget.image;
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          children: [
            Stack(children: [
              Image.asset(
                'assets/images/$img',
                width: 100,
              ),
              Positioned(
                  top: eye1_positiontop.value,
                  right: eye1_positionright.value,
                  child: Image.asset(
                    'assets/images/dot.png',
                    width: 10,
                  )),
              Positioned(
                top: eye2_positiontop.value,
                left: eye2_positionright.value,
                child: Image.asset(
                  'assets/images/dot.png',
                  width: 10,
                ),
              )
            ]),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontFamily: 'NunitoBold',
                    fontSize: 32,
                  ),
                ),
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
