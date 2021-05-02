import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:ru_hacks/data/globals.dart' as globals;

void playSound(String note) {
  final player = AudioCache();
  player.play(note);
}

Future<void> songLoop(String song) async {
  int tempo = int.parse(song.substring(0, 3));
  song = song.substring(3, song.length);
  //globals.numOfStrikes = 0;
  double tempNum;
  int notesCorrectSoFar = 0;
  int i = 0;
  int timeCheck;

  double beat = 60 / tempo;
  //print(beat);

  int currentNoteValue = int.parse(song[1]);
  int lastNoteValue = currentNoteValue;
  String currentNoteLetter = song[0];
  //song = song.substring(2, song.length);
  i += 2;

  //TODO call a clik 4 times for countoff after start is pressed
  for (int i = 0; i < 4; i++) {
    playSound("uiClick.wav");
    print(i.toString());
    tempNum = (beat) * 1000;
    tempNum += (beat / 4) * 1000;
    await new Future.delayed(Duration(milliseconds: tempNum.toInt()));
  }

  //timer for animation
  //globals.timerAmount = tempNum.toInt();

  print("starting play loop");
  while (i <= song.length.toInt()) {
    timeCheck = 0;
    //print("$i: " + lastNoteValue.toString());
    //print("$i: " + currentNoteLetter);
    tempNum = (beat * lastNoteValue) * 1000;
    timeCheck += tempNum.toInt();
    await new Future.delayed(Duration(milliseconds: tempNum.toInt()));

    //check/ wait for user input
    tempNum = (beat / 4) * 1000;
    timeCheck += tempNum.toInt();
    await new Future.delayed(Duration(milliseconds: tempNum.toInt()));

    //print time
    //print("${i}: " + timeCheck.toString());

    //Testing info
    //print("user note:" + globals.currentNote);
    //print("note to play: " + currentNoteLetter);

    //check if user played right note
    if (/*globals.currentNote == currentNoteLetter*/ true) {
      //user got it right
      if(globals.rightNotePlayed.value == globals.rightPrevNotif)
        {
          globals.rightNotePlayed.value++;
        }

      //get next note and value
      if (song.length > 0) {
        lastNoteValue = currentNoteValue;
        if (i < song.length - 1){
          currentNoteValue = int.parse(song[i + 1]);
          print(currentNoteValue);
          currentNoteLetter = song[i];
          print(currentNoteLetter);
        }
        i += 2;
      }

      notesCorrectSoFar++;
    } else {
      if(globals.wrongNotePlayed.value == globals.wrongPrevNotif)
      {
        globals.wrongNotePlayed.value--;
      }
      //user got it wrong so reset measure
      i -= notesCorrectSoFar * 2;
      notesCorrectSoFar = 0;
    }

    //check correct sequence
    if (notesCorrectSoFar >= 4) {
      notesCorrectSoFar = 0;
    }
  }

  //correct note till end of song is reached
  if(globals.rightNotePlayed.value == globals.rightPrevNotif)
  {
    globals.rightNotePlayed.value++;
  }

}
