// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Skill {
  /// Returns the new instance of [Skill] based on arguments.
  Skill.from({
    required this.id,
    required this.iconId,
    required this.name,
    required this.shortName,
    required this.urlName,
    required this.levels,
    required this.finishedLevels,
    required this.lessons,
    required this.finishedLessons,
    required this.proficiency,
    required this.tipsAndNotes,
    required this.finalLevelTimeLimit,
    required this.isAccessible,
    required this.isPerfectOnLastLesson,
    required this.perfectLessonStreak,
    required this.hasFinalLevel,
  });

  /// The id
  final String id;

  /// The icon id
  final int iconId;

  /// The name
  final String name;

  /// The short name
  final String shortName;

  /// The url name
  final String urlName;

  /// The levels
  final int levels;

  /// The finished levels
  final int finishedLevels;

  /// The lessons
  final int lessons;

  /// The finished lessons
  final int finishedLessons;

  /// The proficiency
  final double proficiency;

  /// The tips and notes
  final String tipsAndNotes;

  /// The final level time limit
  final int finalLevelTimeLimit;

  /// The flag that represents is accessible or not
  final bool isAccessible;

  /// The flag that represents is perfect on last lesson or not
  final bool isPerfectOnLastLesson;

  /// The streak of perfect lesson
  final int perfectLessonStreak;

  /// The flag that represents ha final level or not
  final bool hasFinalLevel;
}
