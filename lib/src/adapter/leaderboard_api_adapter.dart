// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:duolingo4d/src/response/leaderboard/leaderboard_response.dart';
import 'package:duolingo4d/src/response/leaderboard/ranking.dart';
import 'package:duolingo4d/src/response/leaderboard/ranking_item.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/adapter/json.dart';

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

  Ranking _buildRanking({
    required Json json,
  }) =>
      Ranking.from(
        rankingItems: _buildRankingItems(json: json),
      );

  List<RankingItem> _buildRankingItems({
    required Json json,
  }) {
    final items = <RankingItem>[];
    for (final key in json.keySet) {
      items.add(
        RankingItem.from(
          userId: key,
          score: json.getIntValue(key: key),
        ),
      );
    }

    return items;
  }
}
