// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/leaderboard/cohort.dart';

class ActiveThread {
  /// Returns the new instance of [ActiveThread] based on arguments.
  ActiveThread.from({
    required this.id,
    required this.xp,
    required this.cohort,
    required this.hasWon,
    required this.hasLost,
    required this.hasPromoted,
    required this.hasDemoted,
  });

  /// The id
  final String id;

  /// The xp
  final int xp;

  /// The cohort
  final Cohort cohort;

  /// The flag that this user has won or not
  final bool hasWon;

  /// The flag that this user has lost or not
  final bool hasLost;

  /// The flag that this user has promoted or not
  final bool hasPromoted;

  /// The flag that this user has demoted or not
  final bool hasDemoted;

  @override
  String toString() {
    return 'CurrentUser(id: $id, xp: $xp, cohort: $cohort, hasWon: $hasWon, hasLost: $hasLost, hasPromoted: $hasPromoted, hasDemoted: $hasDemoted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ActiveThread &&
        other.id == id &&
        other.xp == xp &&
        other.cohort == cohort &&
        other.hasWon == hasWon &&
        other.hasLost == hasLost &&
        other.hasPromoted == hasPromoted &&
        other.hasDemoted == hasDemoted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        xp.hashCode ^
        cohort.hashCode ^
        hasWon.hashCode ^
        hasLost.hashCode ^
        hasPromoted.hashCode ^
        hasDemoted.hashCode;
  }
}
