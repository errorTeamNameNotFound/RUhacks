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

class _TopicTemplateState extends State<TopicTemplate> {
  int index = 0;

  //TODO: BUG when it's at the end
  void addIndex() {
    if (index <= widget.topicList.length) {
      setState(() {
        index++;
      });
    }
  }

  void subIndex() {
    if (index > 0) {
      setState(() {
        index--;
      });
    }
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
                Container(
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
