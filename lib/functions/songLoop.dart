import 'package:audioplayers/audio_cache.dart';
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

  double beat = 60 / tempo;
  //print(beat);

  int lastNoteValue = 0;
  int currentNoteValue = int.parse(song[1]);
  String currentNoteLetter = song[0];
  //song = song.substring(2, song.length);
  i+=2;

  //TODO call a clik 4 times for countoff after start is pressed
  for(int i = 0; i < 4; i++){
    playSound("uiClick.wav");
    print(i.toString());
    tempNum = (beat) * 1000;
    tempNum += (beat / 8) * 1000;
    await new Future.delayed(Duration(milliseconds: tempNum.toInt()));
  }

  print("starting play loop");

  while ( song.length <= 0) {
    tempNum = (beat * lastNoteValue) * 1000;
    await new Future.delayed(Duration(milliseconds: tempNum.toInt()));

    //check/ wait for user input
    tempNum = (beat / 4) * 1000;
    await new Future.delayed(Duration(milliseconds: tempNum.toInt()));

    //Testing info
    //print("user note:" + globals.currentNote);
    //print("note to play: " + currentNoteLetter);

    //check if user played right note
    if (globals.currentNote == currentNoteLetter) {
      //user got it right
      //get next note and value
      if (song.length > 0) {
        lastNoteValue = currentNoteValue;
        currentNoteValue = int.parse(song[i+1]);
        //print(currentNoteValue);
        currentNoteLetter = song[i];
        //print(currentNoteLetter);
        //song = song.substring(2, song.length);
        i+=2;
      }

      notesCorrectSoFar++;
    } else {
      //user got it wrong so reset measure
      i -= notesCorrectSoFar * 2;
      notesCorrectSoFar = 0;
    }

    //check correct sequence
    if(notesCorrectSoFar >= 4){
      notesCorrectSoFar = 0;
    }

    }
  }