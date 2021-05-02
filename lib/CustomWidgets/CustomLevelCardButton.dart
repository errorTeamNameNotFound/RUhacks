import 'package:flutter/material.dart';
import 'package:ru_hacks/constants.dart';

class CustomLevelCardButton extends StatelessWidget {
  final Image songImage;
  final String songTitle;
  final Function toSongLevel;

  CustomLevelCardButton({this.songImage, this.songTitle, this.toSongLevel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toSongLevel,
      child: Container(
        width: MediaQuery.of(context).size.width / kLevelCardWidth,
        height: MediaQuery.of(context).size.height / kLevelCardHeight,
        margin: EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          color: kOffWhite,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: Offset(1, 1),
              color: Colors.grey,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: songImage,
                    //child: Text("(image)"),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  color: Colors.deepPurple,
                  child: Center(
                    child: Text(
                      songTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: kOffWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
