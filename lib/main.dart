import 'package:flutter/material.dart';
import 'package:ru_hacks/database/database.dart';

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
            FloatingActionButton(
              onPressed: () {
                getSongs();
              },
              child: const Icon(Icons.navigation),
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}