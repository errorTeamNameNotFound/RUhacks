import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/BlackKeys.dart';
import 'package:ru_hacks/constants.dart';
import 'package:ru_hacks/data/TutorialTopicLists.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';
import 'package:ru_hacks/data/globals.dart' as globals;
import 'package:rnd/rnd.dart';

const kBirdSize = 3.0;

class playAlong extends StatefulWidget {
  String bOrT;
  List<String> notes;

  playAlong({this.bOrT});

  @override
  _PlayAlongState createState() => _PlayAlongState();
}

class _PlayAlongState extends State<playAlong> {
  int index = 0;
  Random rnd;
  String imageDisplayed = "default";
  double bottomPadding = 0.0;

  Image img() {
    int min = 0;
    int max;
    if (widget.bOrT == "bass") {
      widget.notes = globals.bassNotes;
      max = globals.bassNotes.length - 1;
    } else {
      widget.notes = globals.trebleNotes;
      max = globals.trebleNotes.length - 1;
    }
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    String image_name = widget.notes[r].toString();

    //get note that matches image
    globals.tutorialNote = image_name.substring(17, 18);

    return Image(
      image: AssetImage(image_name),
      fit: BoxFit.fitHeight,
    );
    return Image.asset(image_name);
  }

  void refresh() {
    print(globals.currentNote);
    print(globals.tutorialNote);

    if (globals.currentNote == globals.tutorialNote) {
      setState(() {
        imageDisplayed = "singing";
        bottomPadding = 30.0;
      });
    } else {
      setState(() {
        imageDisplayed = "shocked";
        bottomPadding = 30.0;
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Play Along with Melody"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment
                  .bottomRight, // 10% of the width, so there are ten blinds.
              colors: <Color>[
                Colors.purple[900],
                kRoyalBlue,
              ], // one color to another
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: AnimatedContainer(
                      margin: EdgeInsets.only(left: 50, bottom: bottomPadding),
                      duration: Duration(milliseconds: 80),
                      onEnd: () {
                        setState(() {
                          bottomPadding =
                              0.0; //Brings back to original position
                        });
                      },
                      width: MediaQuery.of(context).size.width / kBirdSize,
                      height: MediaQuery.of(context).size.height / kBirdSize,
                      child: Image(
                        image: AssetImage("assets/birdy/$imageDisplayed.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 7,
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: img(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                PianoKeys(notifyParent: refresh),
                BlackKeys(
                  width: 21,
                  height: 3.6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
