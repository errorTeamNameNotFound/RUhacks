import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Key {
  String keyLabel;
  //Add Piano Sound later

  Key({this.keyLabel});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Key> keys = [
    Key(keyLabel: "C"),
    Key(keyLabel: "D"),
    Key(keyLabel: "E"),
    Key(keyLabel: "F"),
    Key(keyLabel: "G"),
    Key(keyLabel: "A"),
    Key(keyLabel: "B"),
    Key(keyLabel: "C"),
    Key(keyLabel: "D"),
    Key(keyLabel: "E"),
    Key(keyLabel: "F"),
    Key(keyLabel: "G"),
    Key(keyLabel: "A"),
    Key(keyLabel: "B"),
    Key(keyLabel: "C"),
    Key(keyLabel: "D"),
  ];

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
            child: Stack(children: <Widget>[
              // Positioned(
              //
              //   child: Container(
              //     width: MediaQuery.of(context).size.width / 25,
              //     height: MediaQuery.of(context).size.height / 5,
              //     color: Colors.black,
              //   ),
              // ),
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: keys.length,
                itemBuilder: (BuildContext context, int index) {
                  return makePiano(keys[index].keyLabel);
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }

  //Skeleton code for Piano Keys
  Widget makePiano(String label) {
    return GestureDetector(
      onTap: () {
        //TODO: create feedback by changing container color upon press
        print("$label Pressed");
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: 20,
        ),
        width: MediaQuery.of(context).size.width / 16,
        decoration: BoxDecoration(
          border: Border.all(),
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
