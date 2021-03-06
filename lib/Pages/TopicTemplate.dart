import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:ru_hacks/constants.dart';
import 'package:ru_hacks/data/TutorialTopicLists.dart';

const kArrowSize = 15;
const kCardHeight = 1.3;
const kCardWidth = 1.5;

class TopicTemplate extends StatefulWidget {
  String topicLabel;
  List<TopicItem> topicList;

  TopicTemplate({this.topicLabel, this.topicList});

  @override
  _TopicTemplateState createState() => _TopicTemplateState();
}

class _TopicTemplateState extends State<TopicTemplate>
    with SingleTickerProviderStateMixin {
  int index = 0;

  FlipCardController _cardController;

  void addIndex() {
    playSound("flipSFX.wav");
    if (index < widget.topicList.length - 1) {
      setState(() {
        index++;
        _cardController.controller.reverse();
      });
    }
  }

  void subIndex() {
    playSound("flipSFX.wav");
    if (index > 0) {
      setState(() {
        index--;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _cardController = FlipCardController();
  }

  @override
  void dispose() {
    super.dispose();
    _cardController.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topicLabel),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    subIndex();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / kArrowSize,
                    height: MediaQuery.of(context).size.height / kArrowSize,
                    decoration: BoxDecoration(
                      color: kOffWhite,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          offset: Offset(1, 1),
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                FlipCard(
                  controller: _cardController,
                  direction: FlipDirection.VERTICAL,
                  front: Container(
                    width: MediaQuery.of(context).size.width / kCardHeight,
                    height: MediaQuery.of(context).size.height / kCardWidth,
                    decoration: BoxDecoration(
                      color: kOffWhite,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          offset: Offset(1, 1),
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: widget.topicList[index].topicImage,
                      ),
                    ),
                  ),
                  back: Container(
                    width: MediaQuery.of(context).size.width / kCardHeight,
                    height: MediaQuery.of(context).size.height / kCardWidth,
                    decoration: BoxDecoration(
                      color: kOffWhite,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          offset: Offset(1, 1),
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          widget.topicList[index].cardBack,
                          style: TextStyle(fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addIndex();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / kArrowSize,
                    height: MediaQuery.of(context).size.height / kArrowSize,
                    decoration: BoxDecoration(
                      color: kOffWhite,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          offset: Offset(1, 1),
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Text(
              widget.topicList[index].topicLabel,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
