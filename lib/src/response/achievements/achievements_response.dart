// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/achievements/achievement.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

export 'package:duolingo4d/src/response/achievements/achievement.dart';

class AchievementsResponse extends Response {
  /// Returns the new instance of [AchievementsResponse] based on arguments.
  AchievementsResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.achievements,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The achievements
  final List<Achievement> achievements;

  @override
  String toString() => 'AchievementsResponse(achievements: $achievements)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is AchievementsResponse &&
        listEquals(other.achievements, achievements);
  }

  @override
  int get hashCode => achievements.hashCode;
}
