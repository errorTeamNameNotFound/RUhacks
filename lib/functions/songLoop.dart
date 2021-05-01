import 'package:validators/validators.dart';
import 'package:ru_hacks/data/globals.dart' as globals;

Future<void> songLoop(String song) async {
  int tempo = int.parse(song.substring(0, 3));
  song = song.substring(3, song.length);
  int strikes = 0;
  double num;

  double beat = 60 / tempo;
  print(beat);

  int lastNoteValue = 0;
  int currentNoteValue = int.parse(song[1]);
  String currentNoteLetter = song[0];
  song = song.substring(2, song.length);

  //TODO call a clik 4 times for countoff after start is pressed

  while (strikes < 3 || song.length == 0) {
    num = (beat * lastNoteValue) * 1000;
    await new Future.delayed(Duration(milliseconds: num.toInt()));

    //check/ wait for user input
    num = (beat) * 1000;
    await new Future.delayed(Duration(milliseconds: num.toInt()));

    print("user note:" + globals.currentNote);
    print("note to play: " + currentNoteLetter);

    //TODO get user input
    if (true) {
      //user got it right
    } else if (false) {
      //user got it wrong
      //add a strike
    }

    //get next note and value
    if (song.length > 0) {
      lastNoteValue = currentNoteValue;
      currentNoteValue = int.parse(song[1]);
      //print(currentNoteValue);
      currentNoteLetter = song[0];
      //print(currentNoteLetter);
      song = song.substring(2, song.length);
    }

    //TODO shift picture
    //get next 4 note pictures
    if (song.isNotEmpty) {
      //pic 1
      if (isUppercase(song[0])) {
        //print("1: " + song[0] + song[0] + ".png");
      } else {
        //print("1: " + song[0] + ".png");
      }

      //pic 2
      if (song.length > 2) {
        if (isUppercase(song[2])) {
          //print("2: " + song[2] + song[2] + ".png");
        } else {
          //print("2: " + song[2] + ".png");
        }
      }

      //pic 3
      if (song.length > 4) {
        if (isUppercase(song[4])) {
          //print("3: " + song[4] + song[4] + ".png");
        } else {
          //print("3: " + song[4] + ".png");
        }
      }

      //pic 4
      if (song.length > 6) {
        if (isUppercase(song[6])) {
          //print("4: " + song[4] + song[4] + ".png");
        } else {
          //print("4: " + song[4] + ".png");
        }
      }
    }
  }
}
