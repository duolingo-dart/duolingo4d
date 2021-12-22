// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/dictionary/discussion.dart';

/// This class represents the subject in an alternative form.
class AlternativeForm {
  /// Returns the new instance of [AlternativeForm] based on arguments.
  AlternativeForm.from({
    required this.word,
    required this.numeral,
    required this.gender,
    required this.text,
    required this.translationText,
    required this.translation,
    required this.exampleSentence,
    required this.link,
    required this.ttsUrl,
    required this.discussion,
    required this.isMatched,
    required this.isInvalid,
    required this.isHighlighted,
  });

  /// The word
  final String word;

  /// The numeral
  final String numeral;

  /// The gender
  final String gender;

  /// The text
  final String text;

  /// The translation of text
  final String translationText;

  /// The translation
  final String translation;

  /// The example sentence in html format
  final String exampleSentence;

  /// The link to this dictionary in Duolingo
  final String link;

  /// The url of TTS
  final String ttsUrl;

  /// The discussion
  final Discussion discussion;

  /// The flag that represents is matched with word value or not
  final bool isMatched;

  /// The flag that represents is invalid or not
  final bool isInvalid;

  /// The flag that represents is highlighted or not
  final bool isHighlighted;

  @override
  String toString() {
    return 'AlternativeForm(word: $word, numeral: $numeral, gender: $gender, text: $text, translationText: $translationText, translation: $translation, exampleSentence: $exampleSentence, link: $link, ttsUrl: $ttsUrl, discussion: $discussion, isMatched: $isMatched, isInvalid: $isInvalid, isHighlighted: $isHighlighted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlternativeForm &&
        other.word == word &&
        other.numeral == numeral &&
        other.gender == gender &&
        other.text == text &&
        other.translationText == translationText &&
        other.translation == translation &&
        other.exampleSentence == exampleSentence &&
        other.link == link &&
        other.ttsUrl == ttsUrl &&
        other.discussion == discussion &&
        other.isMatched == isMatched &&
        other.isInvalid == isInvalid &&
        other.isHighlighted == isHighlighted;
  }

  @override
  int get hashCode {
    return word.hashCode ^
        numeral.hashCode ^
        gender.hashCode ^
        text.hashCode ^
        translationText.hashCode ^
        translation.hashCode ^
        exampleSentence.hashCode ^
        link.hashCode ^
        ttsUrl.hashCode ^
        discussion.hashCode ^
        isMatched.hashCode ^
        isInvalid.hashCode ^
        isHighlighted.hashCode;
  }
}
