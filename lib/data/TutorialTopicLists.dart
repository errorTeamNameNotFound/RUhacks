import 'package:flutter/material.dart';

class TopicItem {
  String topicLabel;
  Image topicImage;
  String cardBack;

  TopicItem({this.topicLabel, this.topicImage, this.cardBack});
}

List<TopicItem> rhythmTopicList = [
  TopicItem(
    topicLabel: "Eighth Note",
    cardBack: "Note with 1/2 beat",
    topicImage: Image(
      image: NetworkImage(
          "https://www.pngitem.com/pimgs/m/214-2141387_transparent-half-note-clipart-transparent-background-quaver-note.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Quarter Note",
    cardBack: "Note with 1 beat",
    topicImage: Image(
      image: NetworkImage(
          "https://www.pngitem.com/pimgs/m/475-4752934_quarter-note-hd-png-download.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Half Note",
    cardBack: "Note with 2 beats",
    topicImage: Image(
      image: NetworkImage(
          "https://www.pinclipart.com/picdir/big/537-5372389_transparent-background-half-note-clip-art-png-download.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Whole Note",
    cardBack: "Note with 4 beats",
    topicImage: Image(
      image: AssetImage("assets/trebleNotes/wholeNote.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Eighth Rest",
    cardBack: "Rest with 1/2 beat",
    topicImage: Image(
      image: NetworkImage(
          "https://images.vexels.com/media/users/3/143586/isolated/preview/eff7f8818f9042e55a55801513784021-eighth-note-rest-by-vexels.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Quarter Rest",
    cardBack: "Rest with 1 beat",
    topicImage: Image(
      image: NetworkImage(
          "https://www.pngkey.com/png/full/125-1253150_quarter-rest-image-musical-symbol-quarter-rest.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Half Rest",
    cardBack: "Rest with 2 beats",
    topicImage: Image(
      image: NetworkImage(
          "https://image.flaticon.com/icons/png/512/125/125052.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Whole Rest",
    cardBack: "Rest with 4 beats",
    topicImage: Image(
      image: NetworkImage(
          "https://image.flaticon.com/icons/png/512/125/125053.png"),
      fit: BoxFit.contain,
    ),
  ),
];

List<TopicItem> trebleNotesTopicList = [
  TopicItem(
    topicLabel: "E",
    topicImage: Image(
      image: AssetImage("assets/trebleNotes/trebleNoteE.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "F",
    topicImage: Image(
      image: AssetImage("assets/trebleNotes/trebleNoteF.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "G",
    topicImage: Image(
      image: AssetImage("assets/trebleNotes/trebleNoteG.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "A",
    topicImage: Image(
      image: AssetImage("assets/trebleNotes/trebleNoteA.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "B",
    topicImage: Image(
      image: AssetImage("assets/trebleNotes/trebleNoteB.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "C",
    topicImage: Image(
      image: AssetImage("assets/trebleNotes/trebleNoteC.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "D",
    topicImage: Image(
      image: AssetImage("assets/trebleNotes/trebleNoteD.png"),
      fit: BoxFit.contain,
    ),
  ),
];

List<TopicItem> musicTermsTopicList = [
  TopicItem(
    topicLabel: "Crescendo",
    cardBack: "Gradual increase in loudness",
    topicImage: Image(
      image: NetworkImage(
          "https://image.flaticon.com/icons/png/512/222/222777.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Decrescendo / Diminuendo",
    cardBack: "Gradual decrease in loudness",
    topicImage: Image(
      image: NetworkImage(
          "https://image.flaticon.com/icons/png/512/222/222778.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Pianissimo",
    cardBack: "Play very softly",
    topicImage: Image(
      image: NetworkImage(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Music-pianissimo.svg/1200px-Music-pianissimo.svg.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Mezzo Piano",
    cardBack: "Play moderately soft",
    topicImage: Image(
      image: NetworkImage(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Music-mezzopiano.svg/1200px-Music-mezzopiano.svg.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Piano",
    cardBack: "Play softly",
    topicImage: Image(
      image: NetworkImage(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Music_dynamic_piano.svg/1145px-Music_dynamic_piano.svg.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Mezzo Forte",
    cardBack: "Play moderately loud",
    topicImage: Image(
      image: NetworkImage(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Music_dynamic_mezzo_forte.svg/1200px-Music_dynamic_mezzo_forte.svg.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Forte",
    cardBack: "Play loud",
    topicImage: Image(
      image: NetworkImage(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Music_dynamic_forte.svg/1200px-Music_dynamic_forte.svg.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Fortissimo",
    cardBack: "Play very loud",
    topicImage: Image(
      image: NetworkImage(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Music_dynamic_fortissimo.svg/1280px-Music_dynamic_fortissimo.svg.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Staff",
    cardBack:
        "Set of horizontal lines and spaces that represents a different pitch",
    topicImage: Image(
      image: NetworkImage(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Music-staff.svg/1024px-Music-staff.svg.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Note",
    cardBack: "Symbol that represents a different pitch",
    topicImage: Image(
      image: NetworkImage(
          "https://www.pngitem.com/pimgs/m/475-4752934_quarter-note-hd-png-download.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Bass/F Clef",
    cardBack:
        "Notes on the staff played in a lower pitch, usually with a Bass or the left half of the Piano",
    topicImage: Image(
      image: NetworkImage(
          "https://www.transparentpng.com/thumb/clef-note/bass-clef-art-clipart-16.png"),
      fit: BoxFit.contain,
    ),
  ),
  TopicItem(
    topicLabel: "Treble/G Clef",
    cardBack:
        "Notes on the staff played in a higher pitch, usually with a Violin or the right half of the Piano",
    topicImage: Image(
      image: AssetImage("assets/gClef.PNG"),
      fit: BoxFit.contain,
    ),
  ),
];
