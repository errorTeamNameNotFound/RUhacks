import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/CustomMenuButton.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';
import 'package:ru_hacks/Pages/FreestylePage.dart';
import 'package:ru_hacks/Pages/LevelsPage.dart';
import 'package:ru_hacks/Pages/PianoPage.dart';
import 'package:ru_hacks/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void playSound(String fileName) {
    final player = AudioCache();
    player.play(fileName);
  }

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
                    child: Text("(App Name)"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: Text("(Character Picture)"),
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
                            playSound("uiClick.wav");
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
                          whenPressed: () async {
                            playSound("uiClick.wav");
                            await new Future.delayed(const Duration(milliseconds: 50));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {

                                  return LevelsPage();
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