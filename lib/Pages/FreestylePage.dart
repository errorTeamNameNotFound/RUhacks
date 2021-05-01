import 'package:flutter/material.dart';
import 'package:ru_hacks/CustomWidgets/PianoKeys.dart';
import '../constants.dart';

class FreestylePage extends StatefulWidget {
  @override
  _FreestylePageState createState() => _FreestylePageState();
}

class _FreestylePageState extends State<FreestylePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Freestyle"),
      ),
      body: PianoKeys(),
    );
  }
}
