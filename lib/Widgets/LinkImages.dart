import 'package:flutter/material.dart';
import 'package:Boo/Widgets/index.dart';

AnimationController littleeyecontroller;

class LinkImages extends StatefulWidget {
  @override
  _LinkImagesState createState() => _LinkImagesState();
}

class _LinkImagesState extends State<LinkImages> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
        padding: EdgeInsets.only(top: 30),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Image.asset(
                      'assets/images/boo7-1.png',
                      width: 60,
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Image.asset(
                      'assets/images/boo8-1.png',
                      width: 60,
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Image.asset(
                      'assets/images/boo9-1.png',
                      width: 60,
                    )),
              ],
            ),
            LittleEye(width / 3 - 9, width / 3 - 4, 0.0, 0.5),
            LittleEye(width / 2 - 8, width / 2 + 2, 0.3, 0.7),
            LittleEye(2 * width / 3 - 3, 2 * width / 3 + 1, 0.5, 1.0),
          ],
        ));
  }
}
