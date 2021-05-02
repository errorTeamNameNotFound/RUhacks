import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/BlackKeys.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';
import 'package:ru_hacks/Scenes/EndScene.dart';
import 'package:ru_hacks/Scenes/Scene2.dart';
import 'package:ru_hacks/Scenes/Scene3.dart';
import 'package:ru_hacks/Scenes/Scene4.dart';
import 'package:ru_hacks/constants.dart';
import 'package:ru_hacks/functions/songLoop.dart';
import 'dart:math';
import 'package:ru_hacks/data/globals.dart' as globals;

class Scene1 extends StatefulWidget {
  @override
  _Scene1State createState() => _Scene1State();
}

class _Scene1State extends State<Scene1> with SingleTickerProviderStateMixin {
  String _imageDisplayed = "default";
  double _imageSize = 200;
  double horizontalDistance = 250;
  double verticalDistance = -15;
  bool isRight = false;
  int counter = 1;
  var rng = new Random();
  int randInt;

  AnimationController _birdController;

  Animation<double> _horizontalMovement;
  Animation<double> _verticalMovement;

  void wrongCheckCorrect(value) {
    print("wrong: ${value} -- ${globals.wrongPrevNotif}");
    if (value == globals.wrongPrevNotif) {
      return;
    }
    if (value < globals.wrongPrevNotif) {
      isRight = false;
      if (counter == 1) {
        _horizontalMovement = xFirstRightJump();
        _verticalMovement = yFirstWrongJump();

        setState(() {
          _birdController.reset();
          _birdController.forward();
        });

        counter = 1;
      }
      if (counter == 2) {
        _horizontalMovement = xSecondRightJump();
        _verticalMovement = ySecondWrongJump();

        setState(() {
          _birdController.reset();
          _birdController.forward();
        });

        counter = 1;
      }

      if (counter == 3) {
        _horizontalMovement = xThirdRightJump();
        _verticalMovement = yThirdWrongJump();

        setState(() {
          _birdController.reset();
          _birdController.forward();
        });

        counter = 1;
      }
      if (counter == 4) {
        setState(() {
          //print("shocked!!!!!!!!!!!!!!!!!!!!!!!");
          _imageDisplayed = "shocked";
        });

        counter = 1;
      }
    }
    print(counter);
    globals.wrongPrevNotif = globals.wrongNotePlayed.value;
  }

  void rightCheckCorrect(value) {
    // print("right: ${value} -- ${globals.rightPrevNotif}");
    if (value == globals.rightPrevNotif || globals.rightPrevNotif == 0) {
      return;
    }
    if (value > globals.rightPrevNotif) {
      isRight = true;
      if (counter == 1) {
        _horizontalMovement = xFirstRightJump();
        _verticalMovement = yFirstRightJump();

        setState(() {
          _birdController.reset();
          _birdController.forward();
        });
      }
      if (counter == 2) {
        _horizontalMovement = xSecondRightJump();
        _verticalMovement = ySecondRightJump();

        setState(() {
          _birdController.reset();
          _birdController.forward();
        });
      }

      if (counter == 3) {
        _horizontalMovement = xThirdRightJump();
        _verticalMovement = yThirdRightJump();

        setState(() {
          _birdController.reset();
          _birdController.forward();
        });
      }
      if (counter == 4) {
        globals.PicsCurSpot += 4;
        print("${globals.PicsCurSpot} - ${globals.staffPics.length}");
        if (globals.staffPics.length - globals.PicsCurSpot == 4) {
          print("Next Scene is Final Scene");
          globals.lastScene = true;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EndScene();
              },
            ),
          );
        } else if (globals.lastScene) {
          print("Last Scene!!!!!");
          Navigator.pop(context);
        } else {
          randInt = rng.nextInt(4);
          //print("Next Scene => ${randInt}");
          switch (randInt) {
            case 0:
              {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Scene1();
                    },
                  ),
                );
              }
              break;

            case 1:
              {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Scene2();
                    },
                  ),
                );
              }
              break;

            case 2:
              {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Scene3();
                    },
                  ),
                );
              }
              break;

            case 3:
              {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Scene4();
                    },
                  ),
                );
              }
              break;
          }
        }
      }
      counter++;
    }
    // print(counter);
    //print("rightPrevNotif ${globals.rightPrevNotif} => ${globals.rightNotePlayed.value}");
    globals.rightPrevNotif = globals.rightNotePlayed.value;
  }

  @override
  void initState() {
    super.initState();
    _birdController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 700,
      ),
    );

    _horizontalMovement = xFirstRightJump();
    _verticalMovement = yFirstRightJump();

    //This can control the images displayed
    _birdController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          // _imageDisplayed = "default";
          //isRight = true;

          if (isRight) {
            _imageDisplayed = "default";
          } else {
            _imageDisplayed = "fall";
          }
        });
      }
      if (status == AnimationStatus.forward ||
          status == AnimationStatus.reverse) {
        _imageDisplayed = "flying";
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _imageDisplayed = "default";
          //isRight = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _birdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: () {
            globals.breakOut = true;
            Navigator.pop(context);
          },
        ),
        title: Text(
          globals.CurSongName,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 12, //TODO: FLEX
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/birdy/background.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    bottom: 10 + (verticalDistance + 0),
                    child: Container(
                      width: _imageSize,
                      height: _imageSize,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/birdy/branch.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  //TODO: make these branches into a list and output with list view builder
                  //TODO: possible make into its own custom widget
                  Positioned(
                    left: 50 + horizontalDistance,
                    bottom: 10 + (verticalDistance + 0),
                    child: Container(
                      width: _imageSize,
                      height: _imageSize,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/birdy/branch.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50 + (horizontalDistance * 3),
                    bottom: 10 + (verticalDistance + 300),
                    child: Container(
                      width: _imageSize,
                      height: _imageSize,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/birdy/branch.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50 + (horizontalDistance * 2),
                    bottom: 10 + (verticalDistance + 200),
                    child: Container(
                      width: _imageSize,
                      height: _imageSize,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/birdy/branch.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  ValueListenableBuilder(
                      valueListenable: globals.rightNotePlayed,
                      builder: (context, value, widget) {
                        //print("Afrsdfhksadhgfksjfgdhlksdjfghlkfjdghsdjkgfldkjfghdlkjfgh");
                        WidgetsBinding.instance.addPostFrameCallback(
                            (_) => {rightCheckCorrect(value)});
                        //print("Afrsdfhksadhgfksjfgdhlksdjfghlkfjdghsdjkgfldkjfghdlkjfgh");
                        return Container();
                      }),
                  ValueListenableBuilder(
                      valueListenable: globals.wrongNotePlayed,
                      builder: (context, value, widget) {
                        //print("Afrsdfhksadhgfksjfgdhlksdjfghlkfjdghsdjkgfldkjfghdlkjfgh");
                        WidgetsBinding.instance.addPostFrameCallback(
                            (_) => {wrongCheckCorrect(value)});
                        //print("Afrsdfhksadhgfksjfgdhlksdjfghlkfjdghsdjkgfldkjfghdlkjfgh");
                        return Container();
                      }),

                  AnimatedBuilder(
                    animation: _birdController,
                    builder: (BuildContext context, _) {
                      return Transform.translate(
                        // Get animated offset
                        offset: Offset(
                            50 + _horizontalMovement.value,
                            335 -
                                _verticalMovement.value -
                                MediaQuery.of(context).size.width *
                                    0.10), //Animate this
                        child: Container(
                          width: _imageSize,
                          height: _imageSize,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/birdy/$_imageDisplayed.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              // onTap: () {
              //   songLoop(globals.easySongs.first);
              // },
            ),
          ),
          Expanded(
              flex: 5, //TODO: FLEX
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset(globals.staffPics[globals.PicsCurSpot]),
                  ),
                  Expanded(
                    flex: 1,
                    child:
                        Image.asset(globals.staffPics[globals.PicsCurSpot + 1]),
                  ),
                  Expanded(
                    flex: 1,
                    child:
                        Image.asset(globals.staffPics[globals.PicsCurSpot + 2]),
                  ),
                  Expanded(
                    flex: 1,
                    child:
                        Image.asset(globals.staffPics[globals.PicsCurSpot + 3]),
                  ),
                ],
              )),
          Expanded(
            flex: 7, //TODO: FLEX
            child: Stack(
              children: <Widget>[
                PianoKeys(),
                BlackKeys(
                  width: 21,
                  height: 5.6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Animation<double> xFirstRightJump() {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0, end: horizontalDistance),
            weight: 50),
      ],
    ).animate(_birdController);
  }

  Animation<double> yFirstRightJump() {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0, end: 200), weight: 50),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 200, end: 0), weight: 50),
      ],
    ).animate(_birdController);
  }

  Animation<double> yFirstWrongJump() {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0, end: 200), weight: 60),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 200, end: -28), weight: 40),
      ],
    ).animate(_birdController);
  }

  Animation<double> xSecondRightJump() {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(
                begin: horizontalDistance, end: horizontalDistance * 2),
            weight: 50),
      ],
    ).animate(_birdController);
  }

  Animation<double> ySecondRightJump() {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0, end: 300), weight: 50),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 300, end: 200), weight: 50),
      ],
    ).animate(_birdController);
  }

  Animation<double> ySecondWrongJump() {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0, end: 300), weight: 40),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 300, end: -28), weight: 60),
      ],
    ).animate(_birdController);
  }

  Animation<double> xThirdRightJump() {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(
                begin: horizontalDistance * 2, end: horizontalDistance * 3),
            weight: 50),
      ],
    ).animate(_birdController);
  }

  Animation<double> yThirdRightJump() {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 200, end: 400), weight: 50),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 400, end: 300), weight: 50),
      ],
    ).animate(_birdController);
  }

  Animation<double> yThirdWrongJump() {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 200, end: 400), weight: 40),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 400, end: -28), weight: 60),
      ],
    ).animate(_birdController);
  }
}
