import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';
import 'package:ru_hacks/PianoPage.dart';
import 'database/database.dart';
import 'constants.dart';

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
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                getSongs();
                return PianoPage();
              },
            ),
          );
        },
      ),
    );
  }
}
