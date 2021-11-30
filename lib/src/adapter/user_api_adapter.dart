// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/entity/user/user_entity.dart';
import 'package:duolingo4d/src/json.dart';

class UserApiAdapter extends Adapter<UserEntity> {
  @override
  UserEntity execute({
    required Response response,
  }) =>
      _buildUserEntity(
        response: response,
        json: Json.fromJsonString(
          value: response.body,
        ),
      );

  UserEntity _buildUserEntity({
    required Response response,
    required Json json,
  }) =>
      UserEntity.from(
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
        createdAt: DateTime.fromMillisecondsSinceEpoch(
          json.getIntValue(key: 'creationDate'),
        ),
      );
}
