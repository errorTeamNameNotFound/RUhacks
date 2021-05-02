import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:ru_hacks/data/globals.dart' as globals;


List<String> songPicture(String song) {

  //cut off tempo
  song = song.substring(3, song.length);
  List<String> staffPics = [];

  while(song.length > 1){
    if (isUppercase(song[0])) {
      staffPics.add("assets/staffPics/" + song[0] + song[0] + song[1] + ".PNG");
      } else {
      staffPics.add("assets/staffPics/" + song[0] + song[1] + ".PNG");
      }
    //cut off front of string
    song = song.substring(2, song.length);
  }

  // for(int i = 0; i < staffPics.length; i++){
  //   print("${i+1}: " + staffPics[i] );
  // }

  return staffPics;

}