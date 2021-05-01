import 'package:flutter/material.dart';

class PianoKey {
  String pianoLabel;
  //Add Piano Sound later
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: Text("testing"),
            ),
          ),

          //This is where the piano will go
          Expanded(
            child: Row(
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}
