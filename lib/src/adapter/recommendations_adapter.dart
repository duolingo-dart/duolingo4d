// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/recommendations/recommendations_response.dart';

class RecommendationsAdapter extends Adapter<RecommendationsResponse> {
  /// Returns the new instance of [RecommendationsAdapter].
  RecommendationsAdapter.newInstance();

  @override
  RecommendationsResponse convert({
    required Response response,
  }) =>
      _buildResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  /// Returns [RecommendationsResponse] based on [response] and [json].
  RecommendationsResponse _buildResponse({
    required Response response,
    required Json json,
  }) =>
      RecommendationsResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        recommendations: _buildRecommendations(
          jsonArray: json.getArray(key: 'recommendations'),
        ),
      );

  List<Recommendation> _buildRecommendations({
    required JsonArray jsonArray,
  }) {
    final recommendations = <Recommendation>[];
    jsonArray.forEach((json) {
      recommendations.add(
        Recommendation.from(
          userId: '${json.getInt(key: 'userId')}',
          score: json.getDouble(key: 'recommendationScore'),
          reason: json.getString(key: 'recommendationReason'),
          reasonPhrase: json.getString(key: 'recommendationString'),
          user: _buildRecommendedUser(
            json: json.get(key: 'userSummary'),
          ),
        ),
      );
    });

    return recommendations;
  }

  RecommendedUser _buildRecommendedUser({
    required Json json,
  }) =>
      RecommendedUser.from(
        id: '${json.getInt(key: 'id')}',
        name: json.getString(key: 'username'),
        fullname: json.getString(key: 'name'),
        pictureUrl: json.getString(key: 'picture'),
        weeklyXp: json.getInt(key: 'weeklyXp'),
        monthlyXp: json.getInt(key: 'monthlyXp'),
        totalXp: json.getInt(key: 'totalXp'),
      );
}
