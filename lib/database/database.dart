import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ru_hacks/data/globals.dart' as globals;
//import '';

final databaseReference = FirebaseDatabase.instance.reference();

//reference
//https://medium.com/flutterdevs/explore-realtime-database-in-flutter-c5870c2b231f

Map<String, dynamic> toJson(String text) {
  return {
    'message': text,
  };
}

DatabaseReference sendData(String test) {
  // var id = databaseReference.child('toPython/');
  // id.set(toJson(test));
  // return id;
}

Future<void> getSongs() async {
  String result;
  result = (await FirebaseDatabase.instance
          .reference()
          .child("Songs/Hard/Russian Dance")
          .once())
      .value;
  globals.hardSongs.add(result);
  globals.hardSongs.length++;
  //print(result);

  result = (await FirebaseDatabase.instance
          .reference()
          .child("Songs/Easy/Twinkle Twinkle Little Star")
          .once())
      .value;
  globals.easySongs.add(result);
  globals.easySongs.length++;
  //print(result);

  result = (await FirebaseDatabase.instance
          .reference()
          .child("Songs/Medium/Long Long Ago")
          .once())
      .value;
  globals.mediumSongs.add(result);
  globals.mediumSongs.length++;
  //print(result);
}
