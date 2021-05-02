import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'dart:async';
import '../KeyClass.dart';
import 'BlackKeys.dart';
import 'package:ru_hacks/data/globals.dart' as globals;

class PianoKeys extends StatefulWidget {
  final Function() notifyParent;
  PianoKeys({Key key, this.notifyParent}) : super(key: key);
  @override
  _PianoKeysState createState() => _PianoKeysState();
}

class _PianoKeysState extends State<PianoKeys> {



  List<KeyClass> keys = [
    KeyClass(
        keyLabel: "E",
        keyColor: kOffWhite,
        soundFileName: "Base E.mp3",
        keyValue: "e"),
    KeyClass(
        keyLabel: "F",
        keyColor: kOffWhite,
        soundFileName: "Base F.mp3",
        keyValue: "f"),
    KeyClass(
        keyLabel: "G",
        keyColor: kOffWhite,
        soundFileName: "Base G.mp3",
        keyValue: "g"),
    KeyClass(
        keyLabel: "A",
        keyColor: kOffWhite,
        soundFileName: "Base A.mp3",
        keyValue: "a"),
    KeyClass(
        keyLabel: "B",
        keyColor: kOffWhite,
        soundFileName: "Base B.mp3",
        keyValue: "b"),
    KeyClass(
        keyLabel: "C",
        keyColor: kOffWhite,
        soundFileName: "Base C.mp3",
        keyValue: "C"),
    KeyClass(
        keyLabel: "D",
        keyColor: kOffWhite,
        soundFileName: "Treble D.mp3",
        keyValue: "D"),
    KeyClass(
        keyLabel: "E",
        keyColor: kOffWhite,
        soundFileName: "Treble E.mp3",
        keyValue: "E"),
    KeyClass(
        keyLabel: "F",
        keyColor: kOffWhite,
        soundFileName: "Treble F.mp3",
        keyValue: "F"),
    KeyClass(
        keyLabel: "G",
        keyColor: kOffWhite,
        soundFileName: "Treble G.mp3",
        keyValue: "G"),
    KeyClass(
        keyLabel: "A",
        keyColor: kOffWhite,
        soundFileName: "Treble A.mp3",
        keyValue: "A"),
    KeyClass(
        keyLabel: "B",
        keyColor: kOffWhite,
        soundFileName: "Treble B.mp3",
        keyValue: "B"),
  ];

  bool _isPressed = false;

  void playSound(String note) {
    final player = AudioCache();
    player.play(note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: keys.length,
        itemBuilder: (BuildContext context, int index) {
          return makePiano(
            keys[index].keyLabel,
            index,
            keys[index].soundFileName,
          );
        },
      ),
    );
  }

  //Skeleton code for Piano Keys
  Widget makePiano(String label, int index, String soundFileName) {
    return GestureDetector(
      onTap: () {
        //TODO: create feedback by changing container color upon press
        setState(() {
          _isPressed = true;
          playSound(soundFileName);
          keys[index].keyColor = Colors.grey[400];
          globals.currentNote = keys[index].keyValue;
          if(widget.notifyParent != null){
            widget.notifyParent();
          }

        });

        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {
            _isPressed = false;
            keys[index].keyColor = kOffWhite;
          });
        });
        globals.currentNote = keys[index].keyValue;
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: 20,
        ),
        width: MediaQuery.of(context).size.width / keys.length,
        decoration: BoxDecoration(
          color: keys[index].keyColor,
          border: Border.all(
            color: kSemiBlack,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$label",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
