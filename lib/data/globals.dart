//lists of song strings
List<String> easySongs = [];
List<String> mediumSongs = [];
List<String> hardSongs = [];

//pics
List<String> pics = [
  "assets/staffPics/a1.PNG",
  "assets/staffPics/a1.PNG",
  "assets/staffPics/a1.PNG",
  "assets/staffPics/a1.PNG"
];

//current note being played
String currentNote = "";
bool rightNotePlayed = true;
int timerAmount;

//int numOfStrikes;

//time to play in milliseconds
int timeToPlay;
int PicsCurSpot = 0;
bool lastScene = false;

//list for slider
List<String> staffPics = [];
List<int> noteDurations = [];
