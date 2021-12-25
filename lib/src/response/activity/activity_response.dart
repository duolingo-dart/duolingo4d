// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/activity/ranking.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

export 'package:duolingo4d/src/response/activity/ranking.dart';
export 'package:duolingo4d/src/response/activity/score.dart';

/// This class represents a activity of authenticated users.
///
/// This response entity contains the [Ranking] between the authenticated user and friends,
/// as well as a set of [userIds] that will be used as a basis for creating the ranking.
///
/// **_Example_**:
///
/// ```dart
/// void main() async {
///   final duolingo = Duolingo.instance;
///   final response = await duolingo.activity();
///
///   for (final score in response.ranking.scores) {
///     print(score.userId);
///     print(score.xp);
///   }
///
///   print(response.userIds);
/// }
/// ```
class ActivityResponse extends Response {
  /// Returns the new instance of [ActivityResponse] based on arguments.
  ActivityResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.ranking,
    required this.userIds,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The ranking
  final Ranking ranking;

  /// The user IDs
  final List<String> userIds;

  @override
  String toString() => 'ActivityResponse(ranking: $ranking, userIds: $userIds)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ActivityResponse &&
        other.ranking == ranking &&
        listEquals(other.userIds, userIds);
  }

  @override
  int get hashCode => ranking.hashCode ^ userIds.hashCode;
}
