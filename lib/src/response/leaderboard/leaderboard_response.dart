// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/src/response/leaderboard/current_user.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

class LeaderboardResponse extends Response {
  /// Returns the new instance of [LeaderboardResponse] based on arguments.
  LeaderboardResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.currentUser,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The current user
  final CurrentUser currentUser;

  @override
  String toString() => 'LeaderboardResponse(currentUser: $currentUser)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LeaderboardResponse && other.currentUser == currentUser;
  }

  @override
  int get hashCode => currentUser.hashCode;
}
