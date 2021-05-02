import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:ru_hacks/data/globals.dart' as globals;

void playSound(String note) {
  final player = AudioCache();
  player.play(note);
}

Future<void> songLoop(String song) async {
  globals.breakOut = false;
  int tempo = int.parse(song.substring(0, 3));
  song = song.substring(3, song.length);
  //globals.numOfStrikes = 0;
  double tempNum;
  int notesCorrectSoFar = 0;
  int i = 0;
  int timeCheck;
  int tempNotifier;

  double beat = 60 / tempo;
  //print(beat);

  int currentNoteValue = int.parse(song[1]);
  //int lastNoteValue = 0;
  String currentNoteLetter = song[0];
  //song = song.substring(2, song.length);
  i += 2;

  //TODO call a clik 4 times for countoff after start is pressed
  for (int i = 0; i < 4; i++) {
    playSound("uiClick.wav");
    print(i.toString());
    tempNum = (beat) * 1000;
    tempNum += (beat / 2) * 1000;
    await new Future.delayed(Duration(milliseconds: tempNum.toInt()));
  }

  //timer for animation
  //globals.timerAmount = tempNum.toInt();

  print("starting play loop");
  while (i <= song.length.toInt() && !globals.breakOut) {
    timeCheck = 0;
     print("$i: " + currentNoteValue.toString());
     print("$i: " + currentNoteLetter);
    tempNum = (beat * currentNoteValue) * 1000;
    timeCheck += tempNum.toInt();
    await new Future.delayed(Duration(milliseconds: tempNum.toInt()));

    //check/ wait for user input
    tempNum = (beat / 2) * 1000;
    timeCheck += tempNum.toInt();
    await new Future.delayed(Duration(milliseconds: tempNum.toInt()));

    //print time
    //print("${i}: " + timeCheck.toString());

    //Testing info
    //print("user note:" + globals.currentNote);
    //print("note to play: " + currentNoteLetter);

    //check if user played right note
    if (globals.currentNote == currentNoteLetter /*true*/) {
      //user got it right
      if (globals.rightNotePlayed.value == globals.rightPrevNotif) {
        globals.rightNotePlayed.value++;
      }
      //get next note and value
      if (song.length > 0) {
        //lastNoteValue = currentNoteValue;
        if (i < song.length - 1) {
          currentNoteValue = int.parse(song[i + 1]);
          print(currentNoteValue);
          currentNoteLetter = song[i];
          print(currentNoteLetter);
        }
        i += 2;
      }

      notesCorrectSoFar++;
    } else {
      print("before: ${globals.wrongNotePlayed.value} == ${globals.wrongPrevNotif}");
      if (globals.wrongNotePlayed.value == globals.wrongPrevNotif) {
        globals.wrongNotePlayed.value--;
      }
      print("after: ${globals.wrongNotePlayed.value} == ${globals.wrongPrevNotif}");

      //user got it wrong so reset measure
      i -= notesCorrectSoFar * 2;
      print("i = ${i}");
      globals.notesCorrectSoFar = notesCorrectSoFar;
      notesCorrectSoFar = 0;
      currentNoteValue = int.parse(song[i + 1]);
      print(currentNoteValue);
      currentNoteLetter = song[i];
      print(currentNoteLetter);
    }
    globals.currentNote = 'z';

    //check correct sequence
    if (notesCorrectSoFar >= 4) {
      notesCorrectSoFar = 0;
    }
  }

  //correct note till end of song is reached
if(!globals.breakOut)
  {
    for (int i = 0; i < 4 - notesCorrectSoFar; i++) {
      tempNum = (beat * currentNoteValue) * 1000;
      timeCheck += tempNum.toInt();
      await new Future.delayed(Duration(milliseconds: tempNum.toInt()));
      globals.rightNotePlayed.value++;
    }
  }
  globals.rightPrevNotif = 1000;
  globals.wrongPrevNotif = 1000;
  globals.rightNotePlayed.value = 1000;
  globals.wrongNotePlayed.value = 1000;
  globals.breakOut = false;
}
