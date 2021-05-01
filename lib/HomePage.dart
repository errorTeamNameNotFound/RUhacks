import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:async';
import 'CustomWidgets/BlackKeys.dart';

class Key {
  String keyLabel;
  Color keyColor;
  String soundFileName;

  Key({this.keyLabel, this.keyColor, this.soundFileName});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Key> keys = [
    Key(keyLabel: "E", keyColor: kOffWhite, soundFileName: "Base E.mp3"),
    Key(keyLabel: "F", keyColor: kOffWhite, soundFileName: "Base F.mp3"),
    Key(keyLabel: "G", keyColor: kOffWhite, soundFileName: "Base G.mp3"),
    Key(keyLabel: "A", keyColor: kOffWhite, soundFileName: "Base A.mp3"),
    Key(keyLabel: "B", keyColor: kOffWhite, soundFileName: "Base B.mp3"),
    Key(keyLabel: "C", keyColor: kOffWhite, soundFileName: "Base C.mp3"),
    Key(keyLabel: "D", keyColor: kOffWhite, soundFileName: "Treble D.mp3"),
    Key(keyLabel: "E", keyColor: kOffWhite, soundFileName: "Treble E.mp3"),
    Key(keyLabel: "F", keyColor: kOffWhite, soundFileName: "Treble F.mp3"),
    Key(keyLabel: "G", keyColor: kOffWhite, soundFileName: "Treble G.mp3"),
    Key(keyLabel: "A", keyColor: kOffWhite, soundFileName: "Treble A.mp3"),
    Key(keyLabel: "B", keyColor: kOffWhite, soundFileName: "Treble B.mp3"),
  ];

  bool _isPressed = false;

  void playSound(String note) {
    final player = AudioCache();
    player.play(note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //This is where the game area will go
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey,
              child: Center(
                child: Text("testing"),
              ),
            ),
          ),

          //This is where the piano will go
          Expanded(
            child: Stack(
              children: <Widget>[
                ListView.builder(
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
                Positioned(
                  left: 49,
                  child: BlackKeys(),
                ),
              ],
            ),
          ),
        ],
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
        });

        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {
            _isPressed = false;
            keys[index].keyColor = kOffWhite;
          });
        });
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
