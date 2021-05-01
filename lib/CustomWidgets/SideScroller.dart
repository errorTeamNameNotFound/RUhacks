import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';
import 'package:ru_hacks/functions/songLoop.dart';
import 'package:ru_hacks/data/globals.dart' as globals;

class SideScroller extends StatefulWidget {
  @override
  _SideScrollerState createState() => _SideScrollerState();
}

class _SideScrollerState extends State<SideScroller> {
  String _imageDisplayed = "default";
  double _imageSize = 200;
  double distanceBetween = 400;
  double distanceBottom = 80;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/birdy/background.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 50,
              bottom: 10,
              child: Container(
                width: _imageSize,
                height: _imageSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/birdy/branch.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 50 + distanceBetween,
              bottom: 10 + distanceBottom,
              child: Container(
                width: _imageSize,
                height: _imageSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/birdy/branch.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 50,
              bottom: 20,
              child: Container(
                width: _imageSize,
                height: _imageSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/birdy/$_imageDisplayed.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          songLoop(globals.easySongs.first);
        },
      ),
    );
  }
}
