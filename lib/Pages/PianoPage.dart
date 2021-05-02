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
  @override
  _PianoPageState createState() => _PianoPageState();
}

class _PianoPageState extends State<PianoPage> {
  List<Widget> PicList = [];
  final scrollController = ScrollController();

  // String _imageDisplayed = "default";
  // double _imageSize = 200;
  // double distanceBetween = 50;

  @override
  Widget build(BuildContext context) {
    /*PicList.clear();
    songPicture(globals.easySongs.first).forEach((element) {
      PicList.add(
        Image.asset(element),
      );
    });*/

    songPicture(globals.easySongs.first);
    globals.lastScene = false;
    globals.PicsCurSpot = 0;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //songLoop(globals.easySongs.first);
          scrollController.animateTo(PicList.length.toDouble() * 350,
              duration: Duration(milliseconds: 2000), curve: Curves.ease);
          //TODO
        },
      ),
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
      body: EndScene(),
      // body: Scene1(),
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
// =======
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Expanded(
//             flex: 5,
//             child: Column(
//               children: <Widget>[
//                 //This is where the game area will go
//                 SideScroller(),
//                 //debugging purposes

//                 Container(
//                   width: 2000,
//                   height: 200,
//                   child: ListView(
//                     controller: scrollController,
//                     scrollDirection: Axis.horizontal,
//                     children: PicList
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: GestureDetector(
//               //color: Colors.grey,
//               child: Center(
//                 //   child: Text("Side Scroller"),
//                 // ),

//                 child: Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       ElevatedButton(
//                         onPressed: () {
//                           songLoop(globals.easySongs.first);
//                         },
//                         child: Text(
//                           "Right",
//                           style: TextStyle(fontSize: 50),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           songPicture(globals.easySongs.first);
//                         },
//                         child: Text(
//                           "Wrong",
//                           style: TextStyle(fontSize: 50),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               //This is where the piano will go
//               // Expanded(
//               //   child: Stack(
//               //     children: <Widget>[
//               //       //TODO: Uncomment later
//               //       //PianoKeys(),
//               //
//               //       //TODO: Uncomment this after everything has been finalized
//               //       // Positioned(
//               //       //   left: 49,
//               //       //   child: BlackKeys(),
//               //       // ),
//               //     ],
//               //   ),
//               // ),
//             ),
//           ),
//         ],
//       ),
// >>>>>>> master
    );
  }
}
