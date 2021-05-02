import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/BlackKeys.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';
import '../constants.dart';

class FreestylePage extends StatefulWidget {
  @override
  _FreestylePageState createState() => _FreestylePageState();
}

class _FreestylePageState extends State<FreestylePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Freestyle"),
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
      body: Stack(
        children: <Widget>[
          PianoKeys(),
          BlackKeys(
            width: 20,
            height: 1.6,
          ),
        ],
      ),
    );
  }
}
