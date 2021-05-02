import 'package:flutter/material.dart';
import 'package:ru_hacks/constants.dart';

class CustomTutorialCardButton extends StatelessWidget {
  final Image topicImage;
  final String topicLabel;

  CustomTutorialCardButton({this.topicImage, this.topicLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      width: MediaQuery.of(context).size.width / kTutorialCardWidth,
      height: MediaQuery.of(context).size.height / kTutorialCardHeight,
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
        crossAxisAlignment: CrossAxisAlignment.center,
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
                  child: topicImage,
                  //child: Text("(image)"),
                ),
              ),
            ),
          ),
          Text(
            topicLabel,
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }
}
