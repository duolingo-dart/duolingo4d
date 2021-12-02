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
}
