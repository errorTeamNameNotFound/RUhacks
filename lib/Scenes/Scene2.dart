import 'package:flutter/material.dart';
import 'package:ru_hacks/functions/songLoop.dart';
import 'package:ru_hacks/data/globals.dart' as globals;

class Scene2 extends StatefulWidget {
  @override
  _Scene2State createState() => _Scene2State();
}

class _Scene2State extends State<Scene2> with SingleTickerProviderStateMixin {
  String _imageDisplayed = "default";
  double _imageSize = 200;
  double horizontalDistance = 300;
  double verticalDistance = 0;
  bool isRight = false;
  int counter = 1;

  AnimationController _birdController;

  Animation<double> _horizontalMovement;
  Animation<double> _verticalMovement;

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
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "(Song Title)",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
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
                  //TODO: make these branches into a list and output with list view builder
                  //TODO: possible make into its own custom widget
                  Positioned(
                    left: 50 + horizontalDistance,
                    bottom: 10 + (verticalDistance),
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

                  AnimatedBuilder(
                    animation: _birdController,
                    builder: (BuildContext context, _) {
                      return Transform.translate(
                        // Get animated offset
                        offset: Offset(50 + _horizontalMovement.value,
                            335 - _verticalMovement.value), //Animate this
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
              onTap: () {
                songLoop(globals.easySongs.first);
              },
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
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

                          print(counter);
                          counter++;
                        },
                        child: Text(
                          "Right",
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
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
                              _imageDisplayed = "shocked";
                            });

                            counter = 1;
                          }
                          print(counter);
                          // counter = 1;
                        },
                        child: Text(
                          "Wrong",
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
            tween: Tween<double>(begin: 0, end: 300), weight: 50),
      ],
    ).animate(_birdController);
  }

  Animation<double> yFirstRightJump() {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 200, end: 300), weight: 60),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 300, end: 0), weight: 40),
      ],
    ).animate(_birdController);
  }

  Animation<double> yFirstWrongJump() {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 200, end: 300), weight: 60),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 300, end: -20), weight: 40),
      ],
    ).animate(_birdController);
  }

  Animation<double> xSecondRightJump() {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 300, end: 600), weight: 50),
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
            tween: Tween<double>(begin: 300, end: -20), weight: 60),
      ],
    ).animate(_birdController);
  }

  Animation<double> xThirdRightJump() {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 600, end: 900), weight: 50),
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
            tween: Tween<double>(begin: 400, end: -20), weight: 60),
      ],
    ).animate(_birdController);
  }
}