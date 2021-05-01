import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';
import 'package:ru_hacks/functions/songLoop.dart';
import 'package:ru_hacks/data/globals.dart' as globals;

class PianoPage extends StatefulWidget {
  @override
  _PianoPageState createState() => _PianoPageState();
}

class _PianoPageState extends State<PianoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //This is where the game area will go
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: 4,
                itemBuilder: (BuildContext context,int index){
                return globals.pics[index] != "" ? Container(color: Colors.red,) :  Image.asset(globals.pics[index]) ;
                },
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              child: Container(
                color: Colors.grey,
                child: Center(
                  child: Text("Side Scroller"),
                ),
              ),
              onTap: () {
                songLoop(globals.easySongs.first);
              },
            ),
          ),

          //This is where the piano will go
          Expanded(
            flex: 2,
            child: Stack(
              children: <Widget>[
                PianoKeys(),

                //TODO: Uncomment this after everything has been finalized
                // Positioned(
                //   left: 49,
                //   child: BlackKeys(),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
