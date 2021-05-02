import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:ru_hacks/data/globals.dart' as globals;


void songPicture(String song) {

  int tempo = int.parse(song.substring(0, 3));
  int num = 0;
  double beat = 60 / tempo;

  //cut off tempo
  song = song.substring(3, song.length);
  List<String> staffPics = [];
  List<int> noteDurations = [];

  while(song.length > 1){
    if (isUppercase(song[0])) {
      staffPics.add("assets/staffPics/" + song[0] + song[0] + song[1] + ".PNG");
      noteDurations.add(int.parse(song[1]));
      } else {
      staffPics.add("assets/staffPics/" + song[0] + song[1] + ".PNG");
      noteDurations.add(int.parse(song[1]));
      }

    num += int.parse(song[1]);
    //cut off front of string
    song = song.substring(2, song.length);
  }

  for(int i = 0; i < staffPics.length; i++){
    print("${i+1}: " + staffPics[i] );
    print("${i+1}: " + noteDurations[i].toString() );
  }

  //modify global values
  globals.timeToPlay = ((beat * num) * 1000).toInt();
  globals.staffPics = staffPics;
  globals.noteDurations = noteDurations;

}