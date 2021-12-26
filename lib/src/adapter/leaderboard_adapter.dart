// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/leaderboard/leaderboard_response.dart';

class LeaderboardAdapter extends Adapter<LeaderboardResponse> {
  /// Returns the new instance of [LeaderboardAdapter].
  LeaderboardAdapter.newInstance();

  @override
  LeaderboardResponse convert({
    required Response response,
  }) =>
      _buildLeaderboardResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  LeaderboardResponse _buildLeaderboardResponse({
    required Response response,
    required JsonResponse json,
  }) =>
      LeaderboardResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        activeThread: _buildActiveThread(
          json: json.getJson(key: 'active'),
        ),
      );

  ActiveThread _buildActiveThread({
    required JsonResponse json,
  }) =>
      ActiveThread.from(
        id: '${json.getInt(key: 'user_id')}',
        xp: json.getDouble(key: 'score').toInt(),
        cohort: _buildCohort(
          json: json.getJson(key: 'cohort'),
        ),
        hasWon: json.getBool(key: 'is_winner'),
        hasLost: json.getBool(key: 'is_loser'),
        hasPromoted: json.getBool(key: 'is_promoted'),
        hasDemoted: json.getBool(key: 'is_winner'),
      );

  Cohort _buildCohort({
    required JsonResponse json,
  }) =>
      Cohort.from(
        id: json.getString(key: 'cohort_id'),
        ranks: _buildRanks(
          jsonList: json.getJsonList(key: 'rankings'),
        ),
        tier: json.getInt(key: 'tier'),
      );

  List<Rank> _buildRanks({
    required List<JsonResponse> jsonList,
  }) {
    final ranks = <Rank>[];
    for (final json in jsonList) {
      ranks.add(
        Rank.from(
          userId: '${json.getInt(key: 'user_id')}',
          name: json.getString(key: 'display_name'),
          avatarUrl: json.getString(key: 'avatar_url'),
          xp: json.getDouble(key: 'score').toInt(),
          reaction: json.getString(key: 'reaction'),
          isStreakExtendedToday: json.getBool(
            key: 'streak_extended_today',
          ),
        ),
      );
    }

    return ranks;
  }
}
