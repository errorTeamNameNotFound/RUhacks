//lists of song strings
import 'package:flutter/cupertino.dart';

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