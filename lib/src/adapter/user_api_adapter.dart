// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_pro/json_pro.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/user/user_response.dart';

/// This class provides the function to convert the response
/// returned from the user API into the [UserResponse] format.
class UserApiAdapter extends Adapter<UserResponse> {
  /// Returns the new instance of [UserApiAdapter].
  UserApiAdapter.newInstance();

  @override
  UserResponse convert({
    required Response response,
  }) =>
      _buildUserResponse(
        response: response,
        json: Json.fromBytes(bytes: response.bodyBytes),
      );

  /// Returns [UserResponse] based on [response] and [json].
  UserResponse _buildUserResponse({
    required Response response,
    required Json json,
  }) =>
      UserResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        id: json.getInt(key: 'id').toString(),
        username: json.getString(key: 'username'),
        name: json.getString(key: 'name'),
        biography: json.getString(key: 'bio'),
        profileCountry: json.getString(key: 'profileCountry'),
        email: json.getString(key: 'email'),
        isVerifiedEmail: json.getBool(key: 'emailVerified'),
        pictureUrl: json.getString(key: 'picture'),
        timezone: json.getString(key: 'timezone'),
        timezoneOffset: json.getString(key: 'timezoneOffset'),
        motivation: json.getString(key: 'motivation'),
        inviteUrl: json.getString(key: 'inviteURL'),
        fromLanguage: json.getString(key: 'fromLanguage'),
        learningLanguage: json.getString(key: 'learningLanguage'),
        trackingProperty: _buildTrackingProperty(
          json: json.getJson(key: 'trackingProperties'),
        ),
        xpConfiguration: _buildXpConfiguration(
          json: json.getJson(key: 'xpConfig'),
        ),
        gemsConfiguration: _buildGemsConfiguration(
          json: json.getJson(key: 'gemsConfig'),
        ),
        courses: _buildCourses(
          jsonList: json.getJsonList(key: 'courses'),
        ),
        currentCourse: _buildCurrentCourse(
          json: json.getJson(key: 'currentCourse'),
        ),
        lastStreak: _buildLastStreak(
          json: json.getJson(key: 'lastStreak'),
        ),
        xpGoalMetToday: json.getBool(key: 'xpGoalMetToday'),
        xpGoal: json.getInt(key: 'xpGoal'),
        weeklyXp: json.getInt(key: 'weeklyXp'),
        monthlyXp: json.getInt(key: 'monthlyXp'),
        totalXp: json.getInt(key: 'totalXp'),
        lingots: json.getInt(key: 'lingots'),
        gems: json.getInt(key: 'gems'),
        currentCourseId: json.getString(key: 'currentCourseId'),
        coachOutfit: json.getString(key: 'coachOutfit'),
        streak: json.getInt(key: 'streak'),
        longestStreak: json.getInt(key: 'longestStreak'),
        plusStatus: json.getString(key: 'plusStatus'),
        hasPlus: json.getBool(key: 'hasPlus'),
        practiceReminderSettings: _buildPracticeReminderSettings(
          json: json.getJson(key: 'practiceReminderSettings'),
        ),
        createdAt: DateTime.fromMillisecondsSinceEpoch(
          json.getInt(key: 'creationDate'),
        ),
      );

  TrackingProperty _buildTrackingProperty({
    required Json json,
  }) =>
      TrackingProperty.from(
        userId: json.getInt(key: 'user_id').toString(),
        username: json.getString(key: 'username'),
        learningLanguage: json.getString(key: 'learning_language'),
        learningReason: json.getString(key: 'learning_reason'),
        uiLanguage: json.getString(key: 'ui_language'),
        level: json.getInt(key: 'level'),
        followers: json.getInt(key: 'num_followers'),
        following: json.getInt(key: 'num_following'),
        lingots: json.getInt(key: 'lingots'),
        gems: json.getInt(key: 'gems'),
        goalXp: json.getInt(key: 'goal'),
        streak: json.getInt(key: 'streak'),
        hasFullname: json.getBool(key: 'has_fullname'),
        hasItemStreakFreeze: json.getBool(key: 'has_item_streak_freeze'),
        hasItemStreakRepair: json.getBool(key: 'has_item_streak_repair'),
        hasItemStreakWager: json.getBool(key: 'has_item_streak_wager'),
        hasItemWeekendAmulet: json.getBool(key: 'has_item_weekend_amulet'),
        hasItemRupeeWager: json.getBool(key: 'has_item_rupee_wager'),
        hasItemPremiumSubscription: json.getBool(
          key: 'has_item_premium_subscription',
        ),
        hasItemLiveSubscription: json.getBool(
          key: 'has_item_live_subscription',
        ),
        hasItemImmersiveSubscription: json.getBool(
          key: 'has_item_immersive_subscription',
        ),
        hasPicture: json.getBool(key: 'has_picture'),
        hasPhoneNumber: json.getBool(key: 'has_phone_number'),
        isAgeRestricted: json.getBool(key: 'is_age_restricted'),
        isTrialAccount: json.getBool(key: 'trial_account'),
        numberStreakFreeze: json.getInt(key: 'num_item_streak_freeze'),
        numberUnlockedSection: json.getInt(key: 'num_sections_unlocked'),
        numberCompletedSession: json.getInt(key: 'num_sessions_completed'),
        numberUnlockedSkill: json.getInt(key: 'num_skills_unlocked'),
        numberClassroom: json.getInt(key: 'num_classrooms'),
        numberObservee: json.getInt(key: 'num_observees'),
        achievements: json.getStringValues(key: 'achievements'),
      );

  /// Returns [XpConfiguration] based on [json].
  XpConfiguration _buildXpConfiguration({
    required Json json,
  }) =>
      XpConfiguration.from(
        maxSkillTestXp: json.getInt(key: 'maxSkillTestXp'),
        maxPlacementTestXp: json.getInt(key: 'maxPlacementTestXp'),
        maxCheckpointTestXp: json.getInt(key: 'maxCheckpointTestXp'),
      );

  /// Returns [GemsConfiguration] based on [json].
  GemsConfiguration _buildGemsConfiguration({
    required Json json,
  }) =>
      GemsConfiguration.from(
        gems: json.getInt(key: 'gems'),
        gemsPerSkill: json.getInt(key: 'gemsPerSkill'),
        useGems: json.getBool(key: 'useGems'),
      );

  /// Returns [Course] list based on [jsonList].
  List<Course> _buildCourses({
    required List<Json> jsonList,
  }) {
    final courses = <Course>[];

    for (final json in jsonList) {
      courses.add(
        Course.from(
          id: json.getString(key: 'id'),
          title: json.getString(key: 'title'),
          fromLanguage: json.getString(key: 'fromLanguage'),
          learningLanguage: json.getString(key: 'learningLanguage'),
          xp: json.getInt(key: 'xp'),
          crowns: json.getInt(key: 'crowns'),
        ),
      );
    }

    return courses;
  }

  /// Returns [CurrentCourse] based on [json].
  CurrentCourse _buildCurrentCourse({
    required Json json,
  }) =>
      CurrentCourse.from(
        id: json.getString(key: 'id'),
        title: json.getString(key: 'title'),
        fromLanguage: json.getString(key: 'fromLanguage'),
        leraningLanguage: json.getString(key: 'learningLanguage'),
        numberOfLearnedWords: json.getInt(key: 'wordsLearned'),
        numberOfWords: json.getInt(key: 'numberOfWords'),
        numberOfSentences: json.getInt(key: 'numberOfSentences'),
        xp: json.getInt(key: 'xp'),
        crowns: json.getInt(key: 'crowns'),
        extraCrowns: json.getInt(key: 'extraCrowns'),
        skills: _buildSkills(
          jsonList: json.getJsonList(key: 'skills'),
        ),
      );

  /// Returns [Skill] list based on [jsonList].
  List<Skill> _buildSkills({
    required List<Json> jsonList,
  }) {
    final skills = <Skill>[];

    for (final json in jsonList) {
      skills.add(
        Skill.from(
          id: json.getString(key: 'id'),
          iconId: json.getInt(key: 'iconId'),
          name: json.getString(key: 'name'),
          shortName: json.getString(key: 'shortName'),
          urlName: json.getString(key: 'urlName'),
          levels: json.getInt(key: 'levels'),
          finishedLevels: json.getInt(key: 'finishedLevels'),
          lessons: json.getInt(key: 'lessons'),
          finishedLessons: json.getInt(key: 'finishedLessons'),
          proficiency: json.getDouble(key: 'strength'),
          tipsAndNotes: json.getString(key: 'tipsAndNotes'),
          finalLevelTimeLimit: json.getInt(key: 'finalLevelTimeLimit'),
          isAccessible: json.getBool(key: 'accessible'),
          isPerfectOnLastLesson: json.getBool(key: 'lastLessonPerfect'),
          perfectLessonStreak: json.getInt(key: 'perfectLessonStreak'),
          hasFinalLevel: json.getBool(key: 'hasFinalLevel'),
        ),
      );
    }

    return skills;
  }

  /// Returns [LastStreak] based on [json].
  LastStreak _buildLastStreak({
    required Json json,
  }) =>
      LastStreak.from(
        daysAgo: json.getInt(key: 'daysAgo'),
        lastReachedGoalAt: DateTime.fromMillisecondsSinceEpoch(
          json.getInt(key: 'lastReachedGoal'),
        ),
      );

  /// Returns [PracticeReminderSetting] list based on [json].
  List<PracticeReminderSetting> _buildPracticeReminderSettings({
    required Json json,
  }) {
    final practiceReminderSettings = <PracticeReminderSetting>[];

    for (final key in json.keySet) {
      final childJson = json.getJson(key: key);
      practiceReminderSettings.add(
        PracticeReminderSetting.from(
          learningLanguage: key,
          timeInMinutes: childJson.getInt(key: 'timeInMinutes'),
          isEnabledPush: childJson.getBool(key: 'pushEnabled'),
          useSmartReminderTime: childJson.getBool(
            key: 'useSmartReminderTime',
          ),
          isEnabledEmail: childJson.getBool(key: 'emailEnabled'),
        ),
      );
    }

    return practiceReminderSettings;
  }
}
