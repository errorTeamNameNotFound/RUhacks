import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'constants.dart';
import 'dart:async';
import 'CustomWidgets/BlackKeys.dart';

class Key {
  String keyLabel;
  Color keyColor;
  //Add Piano Sound later

  Key({this.keyLabel, this.keyColor});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Key> keys = [
    Key(keyLabel: "D", keyColor: kOffWhite),
    Key(keyLabel: "E", keyColor: kOffWhite),
    Key(keyLabel: "F", keyColor: kOffWhite),
    Key(keyLabel: "G", keyColor: kOffWhite),
    Key(keyLabel: "A", keyColor: kOffWhite),
    Key(keyLabel: "B", keyColor: kOffWhite),
    Key(keyLabel: "C", keyColor: kOffWhite),
    Key(keyLabel: "D", keyColor: kOffWhite),
    Key(keyLabel: "E", keyColor: kOffWhite),
    Key(keyLabel: "F", keyColor: kOffWhite),
    Key(keyLabel: "G", keyColor: kOffWhite),
    Key(keyLabel: "A", keyColor: kOffWhite),
    Key(keyLabel: "B", keyColor: kOffWhite),
    Key(keyLabel: "C", keyColor: kOffWhite),
    Key(keyLabel: "D", keyColor: kOffWhite),
  ];

  Timer _timer;
  bool _isPressed = false;

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
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
  Widget makePiano(String label, int index) {
    return GestureDetector(
      onTap: () {
        //TODO: create feedback by changing container color upon press
        setState(() {
          _isPressed = true;
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
