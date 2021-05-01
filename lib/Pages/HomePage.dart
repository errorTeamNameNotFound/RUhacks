import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/CustomMenuButton.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';
import 'package:ru_hacks/Pages/FreestylePage.dart';
import 'package:ru_hacks/Pages/PianoPage.dart';
import '../constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          //Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment
                    .bottomRight, // 10% of the width, so there are ten blinds.
                colors: <Color>[
                  Colors.purple[900],
                  kRoyalBlue,
                ], // one color to another
              ),
            ),
          ),

          //UI Elements
          Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Text("(App Logo)"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: Text("(App Name)"),
                  ),
                ),
              ),

              //Buttons
              Expanded(
                child: Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CustomMenuButton(
                          buttonLabel: "Freestyle",
                          whenPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return FreestylePage();
                                },
                              ),
                            );
                          },
                        ),
                        CustomMenuButton(
                          buttonLabel: "Levels",
                          whenPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PianoPage();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}