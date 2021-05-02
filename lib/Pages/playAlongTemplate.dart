import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ru_hacks/constants.dart';
import 'package:ru_hacks/data/TutorialTopicLists.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';
import 'package:ru_hacks/data/globals.dart' as globals;
import 'package:rnd/rnd.dart';

const kArrowSize = 15;
const kCardHeight = 1.3;
const kCardWidth = 1.5;

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
    
    
    return Image.asset(image_name);
  }

  Widget refresh() {

    print(globals.currentNote);
    print(globals.tutorialNote);

    if (globals.currentNote == globals.tutorialNote){
      globals.displayText = "good I guess";
      globals.textColor = Colors.green;
    } else {
      globals.displayText = "You're an IDIOT sandwich";
      globals.textColor = Colors.red;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Play Along"),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            Text(
                globals.displayText,
              style: TextStyle(
                fontSize: 40,
                color: globals.textColor,
              ),
    ),
            img(),
            Expanded(
              flex: 7,
              child: PianoKeys(notifyParent: refresh),
            ),
          ],
        ),
      ),
    );
  }
}
