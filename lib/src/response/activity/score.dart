// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents an score in the leaderboard ranking.
class Score {
  /// Returns the new instance of [Score] based on arguments.
  Score.from({
    required this.userId,
    required this.xp,
  });

  /// The user id
  final String userId;

  /// The xp
  final int xp;

  @override
  String toString() => 'Score(userId: $userId, xp: $xp)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Score && other.userId == userId && other.xp == xp;
  }

  @override
  int get hashCode => userId.hashCode ^ xp.hashCode;
}
