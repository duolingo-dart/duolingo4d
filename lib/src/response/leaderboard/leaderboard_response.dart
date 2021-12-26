// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/leaderboard/active_thread.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

export 'package:duolingo4d/src/response/leaderboard/active_thread.dart';
export 'package:duolingo4d/src/response/leaderboard/cohort.dart';
export 'package:duolingo4d/src/response/leaderboard/rank.dart';

class LeaderboardResponse extends Response {
  /// Returns the new instance of [LeaderboardResponse] based on arguments.
  LeaderboardResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.activeThread,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The active thread
  final ActiveThread activeThread;

  @override
  String toString() => 'LeaderboardResponse(activeThread: $activeThread)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LeaderboardResponse && other.activeThread == activeThread;
  }

  @override
  int get hashCode => activeThread.hashCode;
}
