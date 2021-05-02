import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/CustomLevelCardButton.dart';
import 'package:ru_hacks/Pages/PianoPage.dart';
import 'package:ru_hacks/constants.dart';
import 'package:ru_hacks/data/globals.dart' as globals;

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
        songTitle: globals.easyTitles[0],
        toSongLevel: () {
          globals.CurSongName = globals.easyTitles[0];
          playSound("levelSelected.wav");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PianoPage(songString: globals.easySongs[0]);
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
        songTitle: globals.easyTitles[1],
        toSongLevel: () {
          globals.CurSongName = globals.easyTitles[1];
          playSound("levelSelected.wav");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PianoPage(songString: globals.easySongs[1]);
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
        songTitle: globals.easyTitles[2],
        toSongLevel: () {
          globals.CurSongName = globals.easyTitles[2];
          playSound("levelSelected.wav");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PianoPage(songString: globals.easySongs[2]);
              },
            ),
          );
        },
      ),
    ];

    List<CustomLevelCardButton> intermediateSongs = [
      CustomLevelCardButton(
        songImage: Image(
          image: NetworkImage(url),
          fit: BoxFit.contain,
        ),
        songTitle: globals.mediumTitles[0],
        toSongLevel: () {
          playSound("levelSelected.wav");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PianoPage(songString: globals.mediumSongs[0]);
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
        songTitle: globals.mediumTitles[1],
        toSongLevel: () {
          playSound("levelSelected.wav");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PianoPage(songString: globals.mediumSongs[1]);
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
        songTitle: globals.mediumTitles[2],
        toSongLevel: () {
          playSound("levelSelected.wav");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PianoPage(songString: globals.mediumSongs[2]);
              },
            ),
          );
        },
      ),
    ];

    List<CustomLevelCardButton> hardSongs = [
      CustomLevelCardButton(
        songImage: Image(
          image: NetworkImage(url),
          fit: BoxFit.contain,
        ),
        songTitle: globals.hardTitles[0],
        toSongLevel: () {
          playSound("levelSelected.wav");

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PianoPage(songString: globals.hardSongs[0]);
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
        songTitle: globals.hardTitles[1],
        toSongLevel: () {
          playSound("levelSelected.wav");

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PianoPage(songString: globals.hardSongs[1]);
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
        songTitle: globals.hardTitles[2],
        toSongLevel: () {
          playSound("levelSelected.wav");

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PianoPage(songString: globals.hardSongs[2]);
              },
            ),
          );
        },
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
