// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/adapter/json.dart';
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
        json: Json.fromJsonString(
          value: response.body,
        ),
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
        id: json.getIntValue(key: 'id').toString(),
        username: json.getStringValue(key: 'username'),
        name: json.getStringValue(key: 'name'),
        biography: json.getStringValue(key: 'bio'),
        profileCountry: json.getStringValue(key: 'profileCountry'),
        email: json.getStringValue(key: 'email'),
        isVerifiedEmail: json.getBoolValue(key: 'emailVerified'),
        pictureUrl: json.getStringValue(key: 'picture'),
        timezone: json.getStringValue(key: 'timezone'),
        timezoneOffset: json.getStringValue(key: 'timezoneOffset'),
        motivation: json.getStringValue(key: 'motivation'),
        inviteUrl: json.getStringValue(key: 'inviteURL'),
        fromLanguage: json.getStringValue(key: 'fromLanguage'),
        learningLanguage: json.getStringValue(key: 'learningLanguage'),
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

  TrackingProperty _buildTrackingProperty({
    required Json json,
  }) =>
      TrackingProperty.from(
        userId: json.getIntValue(key: 'user_id').toString(),
        username: json.getStringValue(key: 'username'),
        learningLanguage: json.getStringValue(key: 'learning_language'),
        learningReason: json.getStringValue(key: 'learning_reason'),
        uiLanguage: json.getStringValue(key: 'ui_language'),
        level: json.getIntValue(key: 'level'),
        followers: json.getIntValue(key: 'num_followers'),
        following: json.getIntValue(key: 'num_following'),
        lingots: json.getIntValue(key: 'lingots'),
        gems: json.getIntValue(key: 'gems'),
        goalXp: json.getIntValue(key: 'goal'),
        streak: json.getIntValue(key: 'streak'),
        hasFullname: json.getBoolValue(key: 'has_fullname'),
        hasItemStreakFreeze: json.getBoolValue(key: 'has_item_streak_freeze'),
        hasItemStreakRepair: json.getBoolValue(key: 'has_item_streak_repair'),
        hasItemStreakWager: json.getBoolValue(key: 'has_item_streak_wager'),
        hasItemWeekendAmulet: json.getBoolValue(key: 'has_item_weekend_amulet'),
        hasItemRupeeWager: json.getBoolValue(key: 'has_item_rupee_wager'),
        hasItemPremiumSubscription: json.getBoolValue(
          key: 'has_item_premium_subscription',
        ),
        hasItemLiveSubscription: json.getBoolValue(
          key: 'has_item_live_subscription',
        ),
        hasItemImmersiveSubscription: json.getBoolValue(
          key: 'has_item_immersive_subscription',
        ),
        hasPicture: json.getBoolValue(key: 'has_picture'),
        hasPhoneNumber: json.getBoolValue(key: 'has_phone_number'),
        isAgeRestricted: json.getBoolValue(key: 'is_age_restricted'),
        isTrialAccount: json.getBoolValue(key: 'trial_account'),
        numberStreakFreeze: json.getIntValue(key: 'num_item_streak_freeze'),
        numberUnlockedSection: json.getIntValue(key: 'num_sections_unlocked'),
        numberCompletedSession: json.getIntValue(key: 'num_sessions_completed'),
        numberUnlockedSkill: json.getIntValue(key: 'num_skills_unlocked'),
        numberClassroom: json.getIntValue(key: 'num_classrooms'),
        numberObservee: json.getIntValue(key: 'num_observees'),
        achievements: json.getStringValues(key: 'achievements'),
      );

  /// Returns [XpConfiguration] based on [json].
  XpConfiguration _buildXpConfiguration({
    required Json json,
  }) =>
      XpConfiguration.from(
        maxSkillTestXp: json.getIntValue(key: 'maxSkillTestXp'),
        maxPlacementTestXp: json.getIntValue(key: 'maxPlacementTestXp'),
        maxCheckpointTestXp: json.getIntValue(key: 'maxCheckpointTestXp'),
      );

  /// Returns [GemsConfiguration] based on [json].
  GemsConfiguration _buildGemsConfiguration({
    required Json json,
  }) =>
      GemsConfiguration.from(
        gems: json.getIntValue(key: 'gems'),
        gemsPerSkill: json.getIntValue(key: 'gemsPerSkill'),
        useGems: json.getBoolValue(key: 'useGems'),
      );

  /// Returns [Course] list based on [jsonList].
  List<Course> _buildCourses({
    required List<Json> jsonList,
  }) {
    final courses = <Course>[];

    for (final json in jsonList) {
      courses.add(
        Course.from(
          id: json.getStringValue(key: 'id'),
          title: json.getStringValue(key: 'title'),
          fromLanguage: json.getStringValue(key: 'fromLanguage'),
          learningLanguage: json.getStringValue(key: 'learningLanguage'),
          xp: json.getIntValue(key: 'xp'),
          crowns: json.getIntValue(key: 'crowns'),
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
        id: json.getStringValue(key: 'id'),
        title: json.getStringValue(key: 'title'),
        fromLanguage: json.getStringValue(key: 'fromLanguage'),
        leraningLanguage: json.getStringValue(key: 'learningLanguage'),
        numberOfLearnedWords: json.getIntValue(key: 'wordsLearned'),
        numberOfWords: json.getIntValue(key: 'numberOfWords'),
        numberOfSentences: json.getIntValue(key: 'numberOfSentences'),
        xp: json.getIntValue(key: 'xp'),
        crowns: json.getIntValue(key: 'crowns'),
        extraCrowns: json.getIntValue(key: 'extraCrowns'),
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

  /// Returns [LastStreak] based on [json].
  LastStreak _buildLastStreak({
    required Json json,
  }) =>
      LastStreak.from(
        daysAgo: json.getIntValue(key: 'daysAgo'),
        lastReachedGoalAt: DateTime.fromMillisecondsSinceEpoch(
          json.getIntValue(key: 'lastReachedGoal'),
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
          timeInMinutes: childJson.getIntValue(key: 'timeInMinutes'),
          isEnabledPush: childJson.getBoolValue(key: 'pushEnabled'),
          useSmartReminderTime: childJson.getBoolValue(
            key: 'useSmartReminderTime',
          ),
          isEnabledEmail: childJson.getBoolValue(key: 'emailEnabled'),
        ),
      );
    }

    return practiceReminderSettings;
  }
}
