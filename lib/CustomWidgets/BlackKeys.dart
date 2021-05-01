import 'package:flutter/material.dart';
import 'package:ru_hacks/constants.dart';

class BlackKeys extends StatelessWidget {
  Color blackKeyColor = kSemiBlack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 98,
        ),
        Container(
          width: MediaQuery.of(context).size.width / kBlackKeyWidth,
          height: MediaQuery.of(context).size.height / kBlackKeyHeight,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 23,
        ),
        Container(
          width: MediaQuery.of(context).size.width / kBlackKeyWidth,
          height: MediaQuery.of(context).size.height / kBlackKeyHeight,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 23,
        ),
        Container(
          width: MediaQuery.of(context).size.width / kBlackKeyWidth,
          height: MediaQuery.of(context).size.height / kBlackKeyHeight,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 98,
        ),
        Container(
          width: MediaQuery.of(context).size.width / kBlackKeyWidth,
          height: MediaQuery.of(context).size.height / kBlackKeyHeight,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 23,
        ),
        Container(
          width: MediaQuery.of(context).size.width / kBlackKeyWidth,
          height: MediaQuery.of(context).size.height / kBlackKeyHeight,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 105,
        ),
        Container(
          width: MediaQuery.of(context).size.width / kBlackKeyWidth,
          height: MediaQuery.of(context).size.height / kBlackKeyHeight,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 25,
        ),
        Container(
          width: MediaQuery.of(context).size.width / kBlackKeyWidth,
          height: MediaQuery.of(context).size.height / kBlackKeyHeight,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 25,
        ),
        Container(
          width: MediaQuery.of(context).size.width / kBlackKeyWidth,
          height: MediaQuery.of(context).size.height / kBlackKeyHeight,
          color: blackKeyColor,
        ),
      ],
    );
  }
}
