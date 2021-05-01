import 'package:flutter/material.dart';
import 'package:ru_hacks/Pages/HomePage.dart';
import 'constants.dart';
import 'package:ru_hacks/database/database.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kOffWhite,
        primaryColor: kRoyalBlue,
      ),
      home: new HomePage(),
    ),
  );
}
