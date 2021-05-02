import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/CustomTutorialCardButton.dart';
import 'package:ru_hacks/Pages/TopicTemplate.dart';
import 'package:ru_hacks/constants.dart';
import 'package:ru_hacks/data/TutorialTopicLists.dart';

//debugging purposes
String url =
    "https://static.vecteezy.com/system/resources/previews/001/200/798/non_2x/music-note-png.png";

class TutorialsPage extends StatefulWidget {
  @override
  _TutorialsPageState createState() => _TutorialsPageState();
}

class _TutorialsPageState extends State<TutorialsPage> {
  @override
  Widget build(BuildContext context) {
    double sidePadding = MediaQuery.of(context).size.width / 80;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tutorials"),
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
        padding: EdgeInsets.only(
          //horizontal: 80.0,
          left: sidePadding,
          top: 40.0,
          bottom: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTutorialCardButton(
                  goTo: () {
                    playSound("uiClick.wav");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TopicTemplate(
                            topicLabel: "Rhythm",
                            topicList: rhythmTopicList,
                          );
                        },
                      ),
                    );
                  },
                  topicImage: Image(
                    image: NetworkImage(
                        "https://www.kindpng.com/picc/m/7-77504_music-notes-png-transparent-music-note-clipart-png.png"),
                    fit: BoxFit.contain,
                  ),
                  topicLabel: "Rhythm",
                ),
                CustomTutorialCardButton(
                  goTo: () {
                    playSound("uiClick.wav");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TopicTemplate(
                            topicLabel: "Treble Notes",
                            topicList: trebleNotesTopicList,
                          );
                        },
                      ),
                    );
                  },
                  topicImage: Image(
                    image: AssetImage("assets/gClef.PNG"),
                    fit: BoxFit.contain,
                  ),
                  topicLabel: "Treble Notes",
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTutorialCardButton(
                  goTo: () {
                    playSound("uiClick.wav");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TopicTemplate(
                            topicLabel: "Music Terms",
                          );
                        },
                      ),
                    );
                  },
                  topicImage: Image(
                    image: NetworkImage(
                        "https://img2.pngio.com/library-computer-icons-book-symbol-classified-vector-png-library-symbol-png-512_512.png"),
                    fit: BoxFit.contain,
                  ),
                  topicLabel: "Music Terms",
                ),
                CustomTutorialCardButton(
                  goTo: () {
                    playSound("uiClick.wav");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TopicTemplate(
                            topicLabel: "Bass Notes",
                          );
                        },
                      ),
                    );
                  },
                  topicImage: Image(
                    image: NetworkImage(
                        "https://www.pngitem.com/pimgs/m/119-1192338_clef-treble-musical-note-bass-clef-png-transparent.png"),
                    fit: BoxFit.contain,
                  ),
                  topicLabel: "Bass Notes",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
