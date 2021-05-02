import 'package:flutter/material.dart';
import 'package:ru_hacks/Scenes/Scene1.dart';
import 'package:ru_hacks/Scenes/Scene2.dart';
import 'package:ru_hacks/functions/songLoop.dart';
import 'package:ru_hacks/data/globals.dart' as globals;

class SideScroller extends StatefulWidget {
  @override
  _SideScrollerState createState() => _SideScrollerState();
}

class _SideScrollerState extends State<SideScroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //child: Scene2(),
        child: Scene1(),
      ),
    );
  }
}
