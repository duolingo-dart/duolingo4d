// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/user/course.dart';
import 'package:duolingo4d/src/response/user/gems_configuration.dart';
import 'package:duolingo4d/src/response/user/last_streak.dart';
import 'package:duolingo4d/src/response/user/practice_reminder_setting.dart';
import 'package:duolingo4d/src/response/user/skill.dart';
import 'package:duolingo4d/src/response/user/xp_configuration.dart';

export 'package:duolingo4d/src/response/user/xp_configuration.dart';
export 'package:duolingo4d/src/response/user/gems_configuration.dart';
export 'package:duolingo4d/src/response/user/course.dart';
export 'package:duolingo4d/src/response/user/skill.dart';
export 'package:duolingo4d/src/response/user/last_streak.dart';
export 'package:duolingo4d/src/response/user/practice_reminder_setting.dart';

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
    required this.emailVerified,
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
    required this.skills,
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
          statusCode: statusCode,
          reasonPhrase: reasonPhrase,
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

  /// The email verified
  final bool emailVerified;

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

  /// The skills
  final List<Skill> skills;

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
