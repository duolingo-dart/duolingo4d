// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents the state where the goal XP is reached at the end.
class LastStreak {
  /// Returns the new instance of [LastStreak] based on arguments.
  LastStreak.from({
    required this.daysAgo,
    required this.lastReachedGoalAt,
  });

  /// The days since last reached goal
  final int daysAgo;

  /// The last reached goal datetime
  final DateTime lastReachedGoalAt;

  @override
  String toString() =>
      'LastStreak(daysAgo: $daysAgo, lastReachedGoalAt: $lastReachedGoalAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LastStreak &&
        other.daysAgo == daysAgo &&
        other.lastReachedGoalAt == lastReachedGoalAt;
  }

  @override
  int get hashCode => daysAgo.hashCode ^ lastReachedGoalAt.hashCode;
}
