// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/adapter/json.dart';
import 'package:duolingo4d/src/response/leaderboard/leaderboard_response.dart';
import 'package:duolingo4d/src/response/leaderboard/ranking.dart';
import 'package:duolingo4d/src/response/leaderboard/score.dart';

/// This class provides the function to convert the response
/// returned from the leaderboard API into the [LeaderboardResponse] format.
class LeaderboardApiAdapter extends Adapter<LeaderboardResponse> {
  /// Returns the new instance of [LeaderboardApiAdapter].
  LeaderboardApiAdapter.newInstance();

  @override
  LeaderboardResponse convert({
    required Response response,
  }) =>
      _buildLeaderboardResponse(
        response: response,
        json: Json.fromBytes(bytes: response.bodyBytes),
      );

  /// Returns [LeaderboardResponse] based on [response] and [json].
  LeaderboardResponse _buildLeaderboardResponse({
    required Response response,
    required Json json,
  }) =>
      LeaderboardResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        ranking: _buildRanking(json: json.getJson(key: 'ranking')),
        userIds: json.getStringValues(key: 'user_ids_ranked'),
      );

  /// Returns [Ranking] based on [json].
  Ranking _buildRanking({
    required Json json,
  }) =>
      Ranking.from(
        scores: _buildScores(json: json),
      );

  /// Returns list of [Score] based on [json].
  List<Score> _buildScores({
    required Json json,
  }) {
    final items = <Score>[];
    for (final key in json.keySet) {
      items.add(
        Score.from(
          userId: key,
          xp: json.getIntValue(key: key),
        ),
      );
    }

    return items;
  }
}
