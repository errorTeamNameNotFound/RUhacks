import 'package:flutter/material.dart';

class TopicItem {
  String topicLabel;
  Image topicImage;

  TopicItem({this.topicLabel, this.topicImage});
}

List<TopicItem> rhythmTopicList = [
  TopicItem(
    topicLabel: "Eighth Note - 1/2 Beat",
    topicImage: Image(
      image: NetworkImage(
          "https://www.pngitem.com/pimgs/m/214-2141387_transparent-half-note-clipart-transparent-background-quaver-note.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Quarter Note - 1 Beat",
    topicImage: Image(
      image: NetworkImage(
          "https://www.pngitem.com/pimgs/m/475-4752934_quarter-note-hd-png-download.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Half Note - 2 Beats",
    topicImage: Image(
      image: NetworkImage(
          "https://www.pinclipart.com/picdir/big/537-5372389_transparent-background-half-note-clip-art-png-download.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Whole Note - 4 Beats",
    topicImage: Image(
      image: NetworkImage(
          "https://lh3.googleusercontent.com/proxy/diL30PpgLWXiQ8f5X1WvoumRRumd7MmWLis3kvMZdEyMZ1K0joU5Psz44xsUp9O_cSSp_81lg2v0I93fIGGvBfapwwoSHtE"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Eighth Rest - 1/2 Beat",
    topicImage: Image(
      image: NetworkImage(
          "https://images.vexels.com/media/users/3/143586/isolated/preview/eff7f8818f9042e55a55801513784021-eighth-note-rest-by-vexels.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Quarter Rest - 1 Beat",
    topicImage: Image(
      image: NetworkImage(
          "https://www.pngkey.com/png/full/125-1253150_quarter-rest-image-musical-symbol-quarter-rest.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Half Rest - 2 Beat",
    topicImage: Image(
      image: NetworkImage(
          "https://image.flaticon.com/icons/png/512/125/125052.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Whole Rest - 4 Beat",
    topicImage: Image(
      image: NetworkImage(
          "https://image.flaticon.com/icons/png/512/125/125053.png"),
      fit: BoxFit.contain,
    ),
  ),
];

List<TopicItem> trebleNotesTopicList = [];
