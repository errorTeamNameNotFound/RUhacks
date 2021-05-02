import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:ru_hacks/data/globals.dart' as globals;

void songPicture(String song) {
  int tempo = int.parse(song.substring(0, 3));
  int num = 0;
  double tempNum;
  double beat = 60 / tempo;

  //cut off tempo
  song = song.substring(3, song.length);
  List<String> staffPics = [];
  List<int> noteDurations = [];

  while (song.length > 1) {
    if (isUppercase(song[0])) {
      staffPics.add("assets/staffPics/" + song[0] + song[0] + song[1] + ".PNG");
      tempNum = double.parse(song[1]);
      tempNum *= 1000 * beat;
      tempNum += (beat / 4) * 1000;
      noteDurations.add(tempNum.toInt());
    } else {
      staffPics.add("assets/staffPics/" + song[0] + song[1] + ".PNG");
      tempNum = double.parse(song[1]);
      tempNum *= 1000 * beat;
      tempNum += (beat / 4) * 1000;
      noteDurations.add(tempNum.toInt());
    }

    num += int.parse(song[1]);
    //cut off front of string
    song = song.substring(2, song.length);
  }

  for (int i = 0; i < staffPics.length; i++) {
    //print("${i + 1}: " + staffPics[i]);
    print("${i + 1}: " + noteDurations[i].toString());
  }

  //add till staffPics is a multiple of 4
  int endRests = 4 - (staffPics.length % 4);
  for (int i = 0; i < endRests; i++) {
    staffPics.add("assets/staffPics/endStaff.PNG");
  }

  //modify global values
  globals.timeToPlay = ((beat * num) * 1000).toInt();
  globals.staffPics = staffPics;
  globals.noteDurations = noteDurations;
}
