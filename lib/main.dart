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

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[new Text('Add Widgets Here')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final player = AudioCache();
          player.play('Base E.mp3');
        },
        child: Icon(Icons.audiotrack),
        backgroundColor: Colors.black26,
      ),
    );
  }
}
