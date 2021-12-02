// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents the skill information in the course user is learning.
///
/// This skill information includes information about lessons that user have not yet learned,
/// and you can use the [isAccessible] flag to check if a lesson has already been learned.
///
/// Also, the skill information for lessons that user have not yet learned will be set to incomplete
/// and you will not be able to access information such as [tipsAndNotes]. Therefore, if you want to use
/// the complete skill information, be sure to use [isAccessible] for handling.
///
/// **_Example:_**
///
///```dart
///void main() async {
///  final duolingo = Duolingo.getInstance();
///
///  final authResponse = await duolingo.authenticate(
///    username: 'test_username',
///    password: 'test_password',
///  );
///
///  final userResponse = await duolingo.user(userId: authResponse.userId);
///
///  for (final skill in userResponse.currentCourse.skills) {
///    if (skill.isAccessible) {
///       print(skill.name);
///       print(skill.proficiency);
///       print(skill.tipsAndNotes);
///    }
///  }
///}
///```

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
