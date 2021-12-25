// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_pro/json_pro.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/activity/activity_response.dart';

/// This class provides the function to convert the response
/// returned from the Activity API into the [ActivityResponse] format.
class ActivityAdapter extends Adapter<ActivityResponse> {
  /// Returns the new instance of [ActivityAdapter].
  ActivityAdapter.newInstance();

  @override
  ActivityResponse convert({
    required Response response,
  }) =>
      _buildActivityResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  /// Returns [ActivityResponse] based on [response] and [json].
  ActivityResponse _buildActivityResponse({
    required Response response,
    required Json json,
  }) =>
      ActivityResponse.from(
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
          xp: json.getInt(key: key),
        ),
      );
    }

    return items;
  }
}
