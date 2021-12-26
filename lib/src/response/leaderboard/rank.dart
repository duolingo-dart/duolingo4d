// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents an rank in the leaderboard.
class Rank {
  /// Returns the new instance of [Rank] based on arguments.
  Rank.from({
    required this.userId,
    required this.name,
    required this.avatarUrl,
    required this.xp,
    required this.reaction,
    required this.isStreakExtendedToday,
  });

  /// The user id
  final String userId;

  /// The name
  final String name;

  /// The avatar url
  final String avatarUrl;

  /// The xp
  final int xp;

  /// The reaction
  final String reaction;

  /// The flag that represents the streak is extended today or not.
  final bool isStreakExtendedToday;

  @override
  String toString() {
    return 'Rank(userId: $userId, name: $name, avatarUrl: $avatarUrl, xp: $xp, reaction: $reaction, isStreakExtendedToday: $isStreakExtendedToday)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Rank &&
        other.userId == userId &&
        other.name == name &&
        other.avatarUrl == avatarUrl &&
        other.xp == xp &&
        other.reaction == reaction &&
        other.isStreakExtendedToday == isStreakExtendedToday;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        name.hashCode ^
        avatarUrl.hashCode ^
        xp.hashCode ^
        reaction.hashCode ^
        isStreakExtendedToday.hashCode;
  }
}
