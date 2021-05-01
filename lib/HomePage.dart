import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';
import 'package:ru_hacks/Pages/PianoPage.dart';
import 'package:ru_hacks/database/database.dart';
import 'package:ru_hacks/functions/songLoop.dart';
import 'constants.dart';
import 'package:ru_hacks/data/globals.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Piano Game"),
      ),
      body:
      ElevatedButton(
        onPressed: () {
          getSongs();
          Future.delayed(const Duration(milliseconds: 500), () {

            songLoop(globals.easySongs.first);

            setState(() {
              // Here you can write your code for open new view
            });

          });


          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return PianoPage();
          //     },
          //   ),
          // );

        },
      ),
    );
  }
}
