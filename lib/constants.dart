import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer player = new AudioPlayer();
AudioCache playerCache = new AudioCache(fixedPlayer: player);

void playSound(String fileName) {
  playerCache.play(fileName);
}

void stopSound() {
  player.stop();
}

//UI Colors
const kOffWhite = Color(0xfff8f8f8);
const kSemiBlack = Color(0xff121212);
const kDarkBlue = Color(0xff01175B);
const kRoyalBlue = Color(0xff0242FF);
const kSemiRoyalBlue = Color(0xff0A6CFF);
const kSemiLightBlue = Color(0xff2D9DFF);
const kLightBlue = Color(0xff8CDFFE);
const kBlueyWhite = Color(0xffE5F0F3);

//Measurements
const kBlackKeyWidth = 17;
const kBlackKeyHeight = 5;
const kMenuButtonHeight = 9.5;
const kMenuButtonWidth = 3.5;
const kLevelCardHeight = 3;
const kLevelCardWidth = 4;
const kTutorialCardWidth = 3;
const kTutorialCardHeight = 3;

//TextStyles
const kCardHeaderTextStyle = TextStyle(
  fontSize: 30.0,
  color: kSemiBlack,
  fontWeight: FontWeight.bold,
);

TextStyle kTitleTextStyle = TextStyle(
  color: kBlueyWhite,
  fontSize: 80,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
);
