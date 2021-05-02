import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';
import 'package:ru_hacks/CustomWidgets/SideScroller.dart';
import 'package:ru_hacks/Scenes/EndScene.dart';
import 'package:ru_hacks/Scenes/Scene1.dart';
import 'package:ru_hacks/Scenes/Scene2.dart';
import 'package:ru_hacks/Scenes/Scene3.dart';
import 'package:ru_hacks/Scenes/Scene4.dart';
import 'package:ru_hacks/functions/songLoop.dart';
import 'package:ru_hacks/functions/notePicture.dart';
import 'package:ru_hacks/data/globals.dart' as globals;

class PianoPage extends StatefulWidget {
  String songString;

  PianoPage({this.songString});

  @override
  _PianoPageState createState() => _PianoPageState();
}

class _PianoPageState extends State<PianoPage> {
  List<Widget> PicList = [];
  final scrollController = ScrollController();
  bool playButtonDisplayed = true;

  @override
  Widget build(BuildContext context) {
    /*PicList.clear();
    songPicture(globals.easySongs.first).forEach((element) {
      PicList.add(
        Image.asset(element),
      );
    });*/

    print("why? " + widget.songString.toString());
    songPicture(widget.songString);
    globals.currSong = widget.songString;
    globals.lastScene = false;
    globals.PicsCurSpot = 0;
    globals.placement = 0;

    return Scaffold(
      body: Stack(
        children: [
          Scene1(),
          playButtonDisplayed
              ? Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.grey[400].withOpacity(0.8),
                    ),
                    child: IconButton(
                      onPressed: () {
                        songLoop(globals.currSong);
                        setState(() {
                          playButtonDisplayed = false;
                        });
                      },
                      iconSize: 100,
                      icon: Icon(
                        Icons.play_arrow,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
