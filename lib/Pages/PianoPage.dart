import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';
import 'package:ru_hacks/CustomWidgets/SideScroller.dart';
import 'package:ru_hacks/Scenes/Scene1.dart';
import 'package:ru_hacks/functions/songLoop.dart';
import 'package:ru_hacks/data/globals.dart' as globals;

class PianoPage extends StatefulWidget {
  @override
  _PianoPageState createState() => _PianoPageState();
}

class _PianoPageState extends State<PianoPage> {
  // String _imageDisplayed = "default";
  // double _imageSize = 200;
  // double distanceBetween = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "(Song Title)",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Scene1(),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: <Widget>[
      //     SideScroller(),
      //     // Expanded(
      //     //   child: GestureDetector(
      //     //     child: Center(
      //     //       child: Container(
      //     //         child: Row(
      //     //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     //           crossAxisAlignment: CrossAxisAlignment.center,
      //     //           children: <Widget>[
      //     //             ElevatedButton(
      //     //               onPressed: () {},
      //     //               child: Text(
      //     //                 "Right",
      //     //                 style: TextStyle(fontSize: 50),
      //     //               ),
      //     //             ),
      //     //             ElevatedButton(
      //     //               onPressed: () {},
      //     //               child: Text(
      //     //                 "Wrong",
      //     //                 style: TextStyle(fontSize: 50),
      //     //               ),
      //     //             ),
      //     //           ],
      //     //         ),
      //     //       ),
      //     //     ),
      //     //   ),
      //     // ),
      //
      //     //This is where the piano will go
      //     // Expanded(
      //     //   child: Stack(
      //     //     children: <Widget>[
      //     //       //TODO: Uncomment later
      //     //       //PianoKeys(),
      //     //
      //     //       //TODO: Uncomment this after everything has been finalized
      //     //       // Positioned(
      //     //       //   left: 49,
      //     //       //   child: BlackKeys(),
      //     //       // ),
      //     //     ],
      //     //   ),
      //     // ),
      //   ],
      // ),
    );
  }
}
