import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/CustomLevelCardButton.dart';
import 'package:ru_hacks/Pages/PianoPage.dart';
import 'package:ru_hacks/constants.dart';

//debugging purposes
String url =
    "https://static.vecteezy.com/system/resources/previews/001/200/798/non_2x/music-note-png.png";

class LevelsPage extends StatefulWidget {
  @override
  _LevelsPageState createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  @override
  Widget build(BuildContext context) {
    List<CustomLevelCardButton> easySongs = [
      CustomLevelCardButton(
        songImage: Image(
          image: NetworkImage(url),
          fit: BoxFit.contain,
        ),
        songTitle: "Twinkle Twinkle Little Star",
        toSongLevel: () {
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
      CustomLevelCardButton(
        songImage: Image(
          image: NetworkImage(url),
          fit: BoxFit.contain,
        ),
        songTitle: "(Easy song)",
      ),
      CustomLevelCardButton(
        songImage: Image(
          image: NetworkImage(url),
          fit: BoxFit.contain,
        ),
        songTitle: "(Easy song)",
      ),
    ];

    List<CustomLevelCardButton> intermediateSongs = [
      CustomLevelCardButton(
        songImage: Image(
          image: NetworkImage(url),
          fit: BoxFit.contain,
        ),
        songTitle: "Long, Long Ago",
        toSongLevel: () {
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
      CustomLevelCardButton(
        songImage: Image(
          image: NetworkImage(url),
          fit: BoxFit.contain,
        ),
        songTitle: "(Medium song)",
      ),
      CustomLevelCardButton(
        songImage: Image(
          image: NetworkImage(url),
          fit: BoxFit.contain,
        ),
        songTitle: "(Medium song)",
      ),
    ];

    List<CustomLevelCardButton> hardSongs = [
      CustomLevelCardButton(
        songImage: Image(
          image: NetworkImage(url),
          fit: BoxFit.contain,
        ),
        songTitle: "Russian Dance",
        toSongLevel: () {
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
      CustomLevelCardButton(
        songImage: Image(
          image: NetworkImage(url),
          fit: BoxFit.contain,
        ),
        songTitle: "(Hard song)",
      ),
      CustomLevelCardButton(
        songImage: Image(
          image: NetworkImage(url),
          fit: BoxFit.contain,
        ),
        songTitle: "(Hard song)",
      ),
    ];

    double sidePadding = MediaQuery.of(context).size.width / 12;

    return Scaffold(
      appBar: AppBar(
        title: Text("Levels"),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          //horizontal: 80.0,
          left: sidePadding,
          top: 40.0,
          bottom: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Easy",
              style: kCardHeaderTextStyle,
            ),
            Container(
              height: MediaQuery.of(context).size.height / kLevelCardHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: easySongs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: easySongs[index],
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Intermediate",
              style: kCardHeaderTextStyle,
            ),
            Container(
              height: MediaQuery.of(context).size.height / kLevelCardHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: easySongs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: intermediateSongs[index],
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Hard",
              style: kCardHeaderTextStyle,
            ),
            Container(
              height: MediaQuery.of(context).size.height / kLevelCardHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: easySongs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: hardSongs[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
