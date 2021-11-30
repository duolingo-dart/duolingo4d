// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/json.dart';
import 'package:duolingo4d/src/response/user/course.dart';
import 'package:duolingo4d/src/response/user/gems_configuration.dart';
import 'package:duolingo4d/src/response/user/last_streak.dart';
import 'package:duolingo4d/src/response/user/practice_reminder_setting.dart';
import 'package:duolingo4d/src/response/user/skill.dart';
import 'package:duolingo4d/src/response/user/user_response.dart';
import 'package:duolingo4d/src/response/user/xp_configuration.dart';

class UserApiAdapter extends Adapter<UserResponse> {
  @override
  UserResponse execute({
    required Response response,
  }) =>
      _buildUserEntity(
        response: response,
        json: Json.fromJsonString(
          value: response.body,
        ),
      );

  UserResponse _buildUserEntity({
    required Response response,
    required Json json,
  }) =>
      UserResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        id: json.getIntValue(key: 'id'),
        username: json.getStringValue(key: 'username'),
        name: json.getStringValue(key: 'name'),
        biography: json.getStringValue(key: 'bio'),
        profileCountry: json.getStringValue(key: 'profileCountry'),
        email: json.getStringValue(key: 'email'),
        emailVerified: json.getBoolValue(key: 'emailVerified'),
        pictureUrl: json.getStringValue(key: 'picture'),
        timezone: json.getStringValue(key: 'timezone'),
        timezoneOffset: json.getStringValue(key: 'timezoneOffset'),
        motivation: json.getStringValue(key: 'motivation'),
        inviteUrl: json.getStringValue(key: 'inviteURL'),
        fromLanguage: json.getStringValue(key: 'fromLanguage'),
        learningLanguage: json.getStringValue(key: 'learningLanguage'),
        xpConfiguration: _buildXpConfiguration(
          json: json.getJson(key: 'xpConfig'),
        ),
        gemsConfiguration: _buildGemsConfiguration(
          json: json.getJson(key: 'gemsConfig'),
        ),
        courses: _buildCourses(
          jsonList: json.getJsonList(key: 'courses'),
        ),
        skills: _buildSkills(
          jsonList: json.getJsonList(key: 'skills'),
        ),
        lastStreak: _buildLastStreak(
          json: json.getJson(key: 'lastStreak'),
        ),
        xpGoalMetToday: json.getBoolValue(key: 'xpGoalMetToday'),
        xpGoal: json.getIntValue(key: 'xpGoal'),
        weeklyXp: json.getIntValue(key: 'weeklyXp'),
        monthlyXp: json.getIntValue(key: 'monthlyXp'),
        totalXp: json.getIntValue(key: 'totalXp'),
        lingots: json.getIntValue(key: 'lingots'),
        gems: json.getIntValue(key: 'gems'),
        currentCourseId: json.getStringValue(key: 'currentCourseId'),
        coachOutfit: json.getStringValue(key: 'coachOutfit'),
        streak: json.getIntValue(key: 'streak'),
        longestStreak: json.getIntValue(key: 'longestStreak'),
        plusStatus: json.getStringValue(key: 'plusStatus'),
        hasPlus: json.getBoolValue(key: 'hasPlus'),
        practiceReminderSettings: _buildPracticeReminderSettings(
          json: json.getJson(key: 'practiceReminderSettings'),
        ),
        createdAt: DateTime.fromMillisecondsSinceEpoch(
          json.getIntValue(key: 'creationDate'),
        ),
      );

  XpConfiguration _buildXpConfiguration({
    required Json json,
  }) =>
      XpConfiguration.from(
        maxSkillTestXp: json.getIntValue(key: 'maxSkillTestXp'),
        maxPlacementTestXp: json.getIntValue(key: 'maxPlacementTestXp'),
        maxCheckpointTestXp: json.getIntValue(key: 'maxCheckpointTestXp'),
      );

  GemsConfiguration _buildGemsConfiguration({
    required Json json,
  }) =>
      GemsConfiguration.from(
        gems: json.getIntValue(key: 'gems'),
        gemsPerSkill: json.getIntValue(key: 'gemsPerSkill'),
        useGems: json.getBoolValue(key: 'useGems'),
      );

  List<Course> _buildCourses({
    required List<Json> jsonList,
  }) {
    final courses = <Course>[];

    for (final json in jsonList) {
      courses.add(
        Course.from(
          id: json.getStringValue(key: 'id'),
          title: json.getStringValue(key: 'title'),
          authorId: json.getStringValue(key: 'authorId'),
          fromLanguage: json.getStringValue(key: 'fromLanguage'),
          learningLanguage: json.getStringValue(key: 'learningLanguage'),
          preload: json.getBoolValue(key: 'preload'),
          placementTestAvailable: json.getBoolValue(
            key: 'placementTestAvailable',
          ),
          xp: json.getIntValue(key: 'xp'),
          crowns: json.getIntValue(key: 'crowns'),
          healthEnabled: json.getBoolValue(key: 'healthEnabled'),
        ),
      );
    }

    return courses;
  }

  List<Skill> _buildSkills({
    required List<Json> jsonList,
  }) {
    final skills = <Skill>[];

    for (final json in jsonList) {
      skills.add(
        Skill.from(
          id: json.getStringValue(key: 'id'),
          iconId: json.getIntValue(key: 'iconId'),
          name: json.getStringValue(key: 'name'),
          shortName: json.getStringValue(key: 'shortName'),
          urlName: json.getStringValue(key: 'urlName'),
          levels: json.getIntValue(key: 'levels'),
          finishedLevels: json.getIntValue(key: 'finishedLevels'),
          lessons: json.getIntValue(key: 'lessons'),
          finishedLessons: json.getIntValue(key: 'finishedLessons'),
          proficiency: json.getDoubleValue(key: 'strength'),
          tipsAndNotes: json.getStringValue(key: 'tipsAndNotes'),
          finalLevelTimeLimit: json.getIntValue(key: 'finalLevelTimeLimit'),
          isAccessible: json.getBoolValue(key: 'accessible'),
          isPerfectOnLastLesson: json.getBoolValue(key: 'lastLessonPerfect'),
          perfectLessonStreak: json.getIntValue(key: 'perfectLessonStreak'),
          hasFinalLevel: json.getBoolValue(key: 'hasFinalLevel'),
        ),
      );
    }

    return skills;
  }

  LastStreak _buildLastStreak({
    required Json json,
  }) =>
      LastStreak.from(
        daysAgo: json.getIntValue(key: 'daysAgo'),
        lastReachedGoalAt: DateTime.fromMillisecondsSinceEpoch(
          json.getIntValue(key: 'lastReachedGoal'),
        ),
      );

  List<PracticeReminderSetting> _buildPracticeReminderSettings({
    required Json json,
  }) {
    final practiceReminderSettings = <PracticeReminderSetting>[];

    for (final key in json.keySet) {
      final childJson = json.getJson(key: key);
      practiceReminderSettings.add(
        PracticeReminderSetting.from(
          learningLanguage: key,
          timeInMinutes: childJson.getIntValue(key: 'timeInMinutes'),
          pushEnabled: childJson.getBoolValue(key: 'pushEnabled'),
          useSmartReminderTime: childJson.getBoolValue(key: ''),
          emailEnabled: childJson.getBoolValue(key: ''),
        ),
      );
    }

    return practiceReminderSettings;
  }
}
