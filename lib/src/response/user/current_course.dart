// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/user/skill.dart';

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
    required this.isPlacementTestAvailable,
    required this.isHealthEnabled,
    required this.skills,
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

  /// The flag that represents that placement test is available or not
  final bool isPlacementTestAvailable;

  /// The flag that represents health is enabled or not
  final bool isHealthEnabled;

  /// The skills
  final List<Skill> skills;
}
