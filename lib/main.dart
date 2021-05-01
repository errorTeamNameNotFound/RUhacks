import 'package:flutter/material.dart';
import 'package:ru_hacks/HomePage.dart';
import 'constants.dart';
import 'package:ru_hacks/database/database.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: kOffWhite),
      home: new HomePage(),
    ),
  );
}
