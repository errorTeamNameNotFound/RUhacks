import 'package:flutter/material.dart';
import 'package:ru_hacks/constants.dart';

class BlackKeys extends StatelessWidget {
  Color blackKeyColor = kSemiBlack;
  final width;
  final height;

  BlackKeys({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 30,
          height: MediaQuery.of(context).size.height / height,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 130,
        ),
        Container(
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 135,
        ),
        Container(
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 135,
        ),
        Container(
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          color: blackKeyColor,
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          color: blackKeyColor,
        ),
      ],
    );
  }
}
