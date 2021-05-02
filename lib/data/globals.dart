//lists of song strings
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> easySongs = [];
List<String> mediumSongs = [];
List<String> hardSongs = [];

//Current Song Name
String CurSongName = "(Song Title)";

//pics
List<String> pics = [
  "assets/staffPics/a1.PNG",
  "assets/staffPics/a1.PNG",
  "assets/staffPics/a1.PNG",
  "assets/staffPics/a1.PNG"
];

//current note being played
String currentNote = "";
ValueNotifier rightNotePlayed = ValueNotifier(1000);
ValueNotifier wrongNotePlayed = ValueNotifier(1000);
int rightPrevNotif = 1000;
int wrongPrevNotif = 1000;
bool breakOut = false;

//int timerAmount;

//int numOfStrikes;

//time to play in milliseconds
int timeToPlay;
int PicsCurSpot = 0;
bool lastScene = false;

//list for slider
List<String> staffPics = [];
List<int> noteDurations = [];

//scene animation variables
int placement;
int notesCorrectSoFar;

//tutorial variables
List<String> bassNotes = [
  "assets/staffPics/a1.PNG",
  "assets/staffPics/b1.PNG",
  "assets/staffPics/CC1.PNG",
  "assets/staffPics/e1.PNG",
  "assets/staffPics/f1.PNG",
  "assets/staffPics/g1.PNG"
];
List<String> trebleNotes = [
  "assets/staffPics/AA1.PNG",
  "assets/staffPics/CC1.PNG",
  "assets/staffPics/DD1.PNG",
  "assets/staffPics/EE1.PNG",
  "assets/staffPics/FF1.PNG",
  "assets/staffPics/GG1.PNG"
];
String displayText = "What is this note?";
Color textColor = Colors.black;
String tutorialNote = 'A';
