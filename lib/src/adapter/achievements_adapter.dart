// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/achievements/achievements_response.dart';

class AchievementsAdapter extends Adapter<AchievementsResponse> {
  /// Returns the new instance of [AchievementsAdapter].
  AchievementsAdapter.newInstance();

  @override
  AchievementsResponse convert({
    required Response response,
  }) =>
      _buildAchievementsResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  AchievementsResponse _buildAchievementsResponse({
    required Response response,
    required Json json,
  }) =>
      AchievementsResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        achievements: _buildAchievement(
          jsonArray: json.getArray(
            key: 'achievements',
          ),
        ),
      );

  List<Achievement> _buildAchievement({
    required JsonArray jsonArray,
  }) {
    final achievements = <Achievement>[];
    jsonArray.forEach((json) {
      achievements.add(
        Achievement.from(
          name: json.getString(key: 'name'),
          point: json.getInt(key: 'count'),
          level: json.getInt(key: 'tier') + 1,
          levelThresholds: json.getIntValues(key: 'tierCounts'),
        ),
      );
    });

    return achievements;
  }
}
