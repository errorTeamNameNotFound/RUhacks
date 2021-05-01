import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
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
          children: <Widget>[
            new Text('Add Widgets Here')
          ],
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