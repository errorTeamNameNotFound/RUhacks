import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';

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
            flex: 2,
            child: Container(
              color: Colors.grey,
              child: Center(
                child: Text("Side Scroller"),
              ),
            ),
          ),

          //This is where the piano will go
          Expanded(
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
