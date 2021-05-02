import 'package:validators/validators.dart';
import 'package:ru_hacks/data/globals.dart' as globals;

Future<void> songLoop(String song) async {
  int tempo = int.parse(song.substring(0, 3));
  song = song.substring(3, song.length);
  globals.numOfStrikes = 0;
  double num;

  double beat = 60 / tempo;
  //print(beat);

  //TODO get first 4 pictures to display on screen
  //pic 1
  if (isUppercase(song[0])) {
    globals.pics[0] = "staffPics/" + song[0] + song[0] + song[1] + ".PNG";
  } else {
    globals.pics[0] = "staffPics/" + song[0] + song[1] + ".PNG";
  }

  //pic 2
  if (isUppercase(song[2])) {
    globals.pics[1] = "staffPics/" + song[2] + song[2] + song[3] + ".PNG";
  } else {
    globals.pics[1] = "staffPics/" + song[2] + song[3] + ".PNG";
  }

  //pic 3
  if (isUppercase(song[4])) {
    globals.pics[2] = "staffPics/" + song[4] + song[4] + song[5] + ".PNG";
  } else {
    globals.pics[2] = "staffPics/" + song[4] + song[5] + ".PNG";
  }

  //pic 4
  if (isUppercase(song[6])) {
    globals.pics[3] = "staffPics/" + song[6] + song[6] + song[7] + ".PNG";
  } else {
    globals.pics[3] = "staffPics/" + song[6] + song[7] + ".PNG";
  }

  int lastNoteValue = 0;
  int currentNoteValue = int.parse(song[1]);
  String currentNoteLetter = song[0];
  song = song.substring(2, song.length);

  //TODO call a clik 4 times for countoff after start is pressed

  while (globals.numOfStrikes < 3 || song.length <= 0) {
    num = (beat * lastNoteValue) * 1000;
    await new Future.delayed(Duration(milliseconds: num.toInt()));

    //check/ wait for user input
    num = (beat) * 1000;
    await new Future.delayed(Duration(milliseconds: num.toInt()));

    //Testing info
    //print("user note:" + globals.currentNote);
    //print("note to play: " + currentNoteLetter);

    //check if user played right note
    if (globals.currentNote == currentNoteLetter) {
      //user got it right
    } else {
      //user got it wrong so add a strike
      //globals.numOfStrikes++;
    }

    //get next 4 note pictures
    if (song.isNotEmpty) {
      //pic 1
      if (isUppercase(song[0])) {
        globals.pics[0] = "staffPics/" + song[0] + song[0] + song[1] + ".PNG";
      } else {
        globals.pics[0] = "staffPics/" + song[0] + song[1] + ".PNG";
      }

      //pic 2
      if (song.length > 2) {
        if (isUppercase(song[2])) {
          globals.pics[1] = "staffPics/" + song[2] + song[2] + song[3] + ".PNG";
        } else {
          globals.pics[1] = "staffPics/" + song[2] + song[3] + ".PNG";
        }
      }else {
        globals.pics[1] = "endStaff.PNG";
      }

      //pic 3
      if (song.length > 4) {
        if (isUppercase(song[4])) {
          globals.pics[2] = "staffPics/" + song[4] + song[4] + song[5] + ".PNG";
        } else {
          globals.pics[2] = "staffPics/" + song[4] + song[5] + ".PNG";
        }
      }else {
        globals.pics[2] = "endStaff.PNG";
      }

      //pic 4
      if (song.length > 6) {
        if (isUppercase(song[6])) {
          globals.pics[3] = "staffPics/" + song[6] + song[6] + song[7] + ".PNG";
        } else {
          globals.pics[3] = "staffPics/" + song[6] + song[7] + ".PNG";
        }
      } else {
        globals.pics[3] = "endStaff.PNG";
      }

      //get next note and value
      if (song.length > 0) {
        lastNoteValue = currentNoteValue;
        currentNoteValue = int.parse(song[1]);
        print(currentNoteValue);
        currentNoteLetter = song[0];
        print(currentNoteLetter);
        song = song.substring(2, song.length);
      }
    } else {
      globals.pics[0] = "endStaff.PNG";
    }
  }
}
