// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:collection/collection.dart';

import 'package:duolingo4d/src/response/recommendations/recommendation.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

export 'package:duolingo4d/src/response/recommendations/recommendation.dart';
export 'package:duolingo4d/src/response/recommendations/recommended_user.dart';

class RecommendationsResponse extends Response {
  /// Returns the new instance of [RecommendationsResponse] based on arguments.
  RecommendationsResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.recommendations,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The recommendations
  final List<Recommendation> recommendations;

  @override
  String toString() =>
      'RecommendationsResponse(recommendations: $recommendations)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is RecommendationsResponse &&
        listEquals(other.recommendations, recommendations);
  }

  @override
  int get hashCode => recommendations.hashCode;
}
