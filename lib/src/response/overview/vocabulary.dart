import 'package:collection/collection.dart';

// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents the word data that the user has already learned.
class Vocabulary {
  /// Returns the new instance of [Vocabulary] based on arguments.
  Vocabulary.from({
    required this.id,
    required this.word,
    required this.normalizedWord,
    required this.strengthBars,
    required this.proficiency,
    required this.infinitive,
    required this.skill,
    required this.skillUrlTitle,
    required this.pos,
    required this.gender,
    required this.lexemeId,
    required this.relatedLexemes,
    required this.lastPracticed,
    required this.lastPracticedMs,
  });

  /// The id
  final String id;

  /// The word
  final String word;

  /// The normalized word
  final String normalizedWord;

  /// The strength bars
  final int strengthBars;

  /// The proficiency
  final double proficiency;

  /// The infinitive
  final String infinitive;

  /// The skill
  final String skill;

  /// The skill url title
  final String skillUrlTitle;

  /// The pos
  final String pos;

  /// The gender
  final String gender;

  /// The lexeme id
  final String lexemeId;

  /// The related lexemes
  final List<String> relatedLexemes;

  /// The last practiced
  final String lastPracticed;

  /// The last practices in milliseconds
  final int lastPracticedMs;

  @override
  String toString() {
    return 'Vocabulary(id: $id, word: $word, normalizedWord: $normalizedWord, strengthBars: $strengthBars, proficiency: $proficiency, infinitive: $infinitive, skill: $skill, skillUrlTitle: $skillUrlTitle, pos: $pos, gender: $gender, lexemeId: $lexemeId, relatedLexemes: $relatedLexemes, lastPracticed: $lastPracticed, lastPracticedMs: $lastPracticedMs)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Vocabulary &&
        other.id == id &&
        other.word == word &&
        other.normalizedWord == normalizedWord &&
        other.strengthBars == strengthBars &&
        other.proficiency == proficiency &&
        other.infinitive == infinitive &&
        other.skill == skill &&
        other.skillUrlTitle == skillUrlTitle &&
        other.pos == pos &&
        other.gender == gender &&
        other.lexemeId == lexemeId &&
        listEquals(other.relatedLexemes, relatedLexemes) &&
        other.lastPracticed == lastPracticed &&
        other.lastPracticedMs == lastPracticedMs;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        word.hashCode ^
        normalizedWord.hashCode ^
        strengthBars.hashCode ^
        proficiency.hashCode ^
        infinitive.hashCode ^
        skill.hashCode ^
        skillUrlTitle.hashCode ^
        pos.hashCode ^
        gender.hashCode ^
        lexemeId.hashCode ^
        relatedLexemes.hashCode ^
        lastPracticed.hashCode ^
        lastPracticedMs.hashCode;
  }
}
