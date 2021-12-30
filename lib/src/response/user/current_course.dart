// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/user/skill_book.dart';

/// This class represents the course that the user is currently selecting.
///
/// Skill information is included as [skillBook] in this current course information.
class CurrentCourse {
  /// Returns the new instance of [CurrentCourse] based on arguments.
  CurrentCourse.from({
    required this.id,
    required this.title,
    required this.fromLanguage,
    required this.leraningLanguage,
    required this.numberOfLearnedWords,
    required this.numberOfWords,
    required this.numberOfSentences,
    required this.xp,
    required this.crowns,
    required this.extraCrowns,
    required this.skillBook,
  });

  /// The id
  final String id;

  /// The title
  final String title;

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String leraningLanguage;

  /// The number of learned words
  final int numberOfLearnedWords;

  /// The number of words
  final int numberOfWords;

  /// The number of sentences
  final int numberOfSentences;

  /// The XP
  final int xp;

  /// The crowns
  final int crowns;

  /// The extra crowns
  final int extraCrowns;

  /// The skill book
  final SkillBook skillBook;

  @override
  String toString() {
    return 'CurrentCourse(id: $id, title: $title, fromLanguage: $fromLanguage, leraningLanguage: $leraningLanguage, numberOfLearnedWords: $numberOfLearnedWords, numberOfWords: $numberOfWords, numberOfSentences: $numberOfSentences, xp: $xp, crowns: $crowns, extraCrowns: $extraCrowns, skillBook: $skillBook)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrentCourse &&
        other.id == id &&
        other.title == title &&
        other.fromLanguage == fromLanguage &&
        other.leraningLanguage == leraningLanguage &&
        other.numberOfLearnedWords == numberOfLearnedWords &&
        other.numberOfWords == numberOfWords &&
        other.numberOfSentences == numberOfSentences &&
        other.xp == xp &&
        other.crowns == crowns &&
        other.extraCrowns == extraCrowns &&
        other.skillBook == skillBook;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        fromLanguage.hashCode ^
        leraningLanguage.hashCode ^
        numberOfLearnedWords.hashCode ^
        numberOfWords.hashCode ^
        numberOfSentences.hashCode ^
        xp.hashCode ^
        crowns.hashCode ^
        extraCrowns.hashCode ^
        skillBook.hashCode;
  }
}
