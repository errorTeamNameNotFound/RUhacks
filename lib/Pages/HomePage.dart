import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/CustomMenuButton.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';
import 'package:ru_hacks/Pages/FreestylePage.dart';
import 'package:ru_hacks/Pages/LevelsPage.dart';
import 'package:ru_hacks/Pages/PianoPage.dart';
import 'package:ru_hacks/Pages/LevelsPage.dart';
import 'package:ru_hacks/Pages/TutorialsPage.dart';
import '../constants.dart';
import 'package:ru_hacks/database/database.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _logoController;
  Animation<double> _rotate;

  @override
  void initState() {
    super.initState();
    _logoController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _rotate = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: -0.1, end: 0.1),
          weight: 50,
        ),
      ],
    ).animate(_logoController);

    _logoController.repeat(
      reverse: true,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                    child: Text(
                      "Play with Melody",
                      style: kTitleTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: AnimatedBuilder(
                  animation: _logoController,
                  builder: (BuildContext context, _) {
                    return Transform.rotate(
                      // Get animated offset
                      angle: _rotate.value,
                      child: Container(
                        child: Center(
                          child: Image.asset(
                            "assets/birdy/logo.png",
                          ),
                          //child: Text("(Character Picture)"),
                        ),
                      ),
                    );
                  },
                ),

                // child: Container(
                //   child: Center(
                //     child: Image.asset(
                //       "assets/birdy/logo.png",
                //     ),
                //     //child: Text("(Character Picture)"),
                //   ),
                // ),
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
                          whenPressed: () {
                            playSound("uiClick.wav");
                            getSongs();
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
                        CustomMenuButton(
                          buttonLabel: "Tutorials",
                          whenPressed: () {
                            playSound("uiClick.wav");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return TutorialsPage();
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
