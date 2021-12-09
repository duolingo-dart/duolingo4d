// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/duolingo4d.dart';
import 'package:duolingo4d/src/response/leaderboard/ranking.dart';

class LeaderboardResponse extends Response {
  /// Returns the new instance of [LeaderboardResponse] based on arguments.
  LeaderboardResponse.from({
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
}
