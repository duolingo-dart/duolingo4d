// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';
import 'package:duolingo4d/src/response/user/course.dart';
import 'package:duolingo4d/src/response/user/current_course.dart';
import 'package:duolingo4d/src/response/user/gems_configuration.dart';
import 'package:duolingo4d/src/response/user/last_streak.dart';
import 'package:duolingo4d/src/response/user/practice_reminder_setting.dart';
import 'package:duolingo4d/src/response/user/xp_configuration.dart';

export 'package:duolingo4d/src/response/user/xp_configuration.dart';
export 'package:duolingo4d/src/response/user/gems_configuration.dart';
export 'package:duolingo4d/src/response/user/course.dart';
export 'package:duolingo4d/src/response/user/current_course.dart';
export 'package:duolingo4d/src/response/user/skill.dart';
export 'package:duolingo4d/src/response/user/last_streak.dart';
export 'package:duolingo4d/src/response/user/practice_reminder_setting.dart';

/// This class represents the response entity of the User API in the Duolingo API.
///
/// This entity contains information such as the authenticated user's lingot and XP,
/// as well as information about the courses they have studied and their skills.
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
///  print(userResponse.name);
///  print(userResponse.lingots);
///
///  for (final course in userResponse.courses) {
///    print(course.title);
///    print(course.xp);
///  }
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
class UserResponse extends Response {
  /// Returns the new instance of [UserResponse] based on arguments.
  UserResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.id,
    required this.username,
    required this.name,
    required this.biography,
    required this.profileCountry,
    required this.email,
    required this.isVerifiedEmail,
    required this.pictureUrl,
    required this.timezone,
    required this.timezoneOffset,
    required this.motivation,
    required this.inviteUrl,
    required this.fromLanguage,
    required this.learningLanguage,
    required this.xpConfiguration,
    required this.gemsConfiguration,
    required this.courses,
    required this.currentCourse,
    required this.lastStreak,
    required this.xpGoalMetToday,
    required this.xpGoal,
    required this.weeklyXp,
    required this.monthlyXp,
    required this.totalXp,
    required this.lingots,
    required this.gems,
    required this.currentCourseId,
    required this.coachOutfit,
    required this.streak,
    required this.longestStreak,
    required this.plusStatus,
    required this.hasPlus,
    required this.practiceReminderSettings,
    required this.createdAt,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The id
  final int id;

  /// The username
  final String username;

  /// The name
  final String name;

  /// The biography
  final String biography;

  /// The profile country
  final String profileCountry;

  /// The email
  final String email;

  /// The flag that represents email is verified or not
  final bool isVerifiedEmail;

  /// The picture url
  final String pictureUrl;

  /// The timezone
  final String timezone;

  /// The offset of timezone
  final String timezoneOffset;

  /// The motivation
  final String motivation;

  /// The invite url
  final String inviteUrl;

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  /// The XP configuration
  final XpConfiguration xpConfiguration;

  /// The gems configuration
  final GemsConfiguration gemsConfiguration;

  /// The courses
  final List<Course> courses;

  /// The current course
  final CurrentCourse currentCourse;

  /// The last streak
  final LastStreak lastStreak;

  /// The flag that represents xp goal met today or not
  final bool xpGoalMetToday;

  /// The xp goal
  final int xpGoal;

  /// The weekly xp
  final int weeklyXp;

  /// The monthly xp
  final int monthlyXp;

  /// The total xp
  final int totalXp;

  /// The lingots
  final int lingots;

  /// The gems
  final int gems;

  /// The current course id
  final String currentCourseId;

  /// The coach outfit
  final String coachOutfit;

  /// The streak
  final int streak;

  /// The longest streak
  final int longestStreak;

  /// The plus status
  final String plusStatus;

  /// The flag that represents user has plus status or not
  final bool hasPlus;

  /// The practice reminder settings
  final List<PracticeReminderSetting> practiceReminderSettings;

  /// The created datetime
  final DateTime createdAt;
}
