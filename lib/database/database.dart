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

  //Easy
  await FirebaseDatabase.instance
      .reference()
      .child("Songs/Easy/")
      .once()
      .then((DataSnapshot snapshot) {
    //pulls titles in order and triples them
    //print(snapshot.value);
    //snapshot.value
    (Map<dynamic, dynamic>.from(snapshot.value)).forEach((key, value) {
      globals.easySongs.add(value.toString());
      globals.easyTitles.add(key.toString());
    });
  });

  //Medium
  await FirebaseDatabase.instance
      .reference()
      .child("Songs/Medium/")
      .once()
      .then((DataSnapshot snapshot) {
    //pulls titles in order and triples them
    //print(snapshot.value);
    //snapshot.value
    (Map<dynamic, dynamic>.from(snapshot.value)).forEach((key, value) {
      globals.mediumSongs.add(value.toString());
      globals.mediumTitles.add(key.toString());
    });
  });

  //Hard
  await FirebaseDatabase.instance
      .reference()
      .child("Songs/Hard/")
      .once()
      .then((DataSnapshot snapshot) {
    //pulls titles in order and triples them
    //print(snapshot.value);
    //snapshot.value
    (Map<dynamic, dynamic>.from(snapshot.value)).forEach((key, value) {
      globals.hardSongs.add(value.toString());
      globals.hardTitles.add(key.toString());
    });
  });

  await new Future.delayed(const Duration(seconds: 3));
}
