// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/leaderboard/rank.dart';

class Cohort {
  /// Returns the new instance of [Cohort] based on arguments.
  Cohort.from({
    required this.id,
    required this.ranks,
    required this.tier,
  });

  /// The id
  final String id;

  /// The ranks
  final List<Rank> ranks;

  /// The tier
  final int tier;

  @override
  String toString() => 'Cohort(id: $id, ranks: $ranks, tier: $tier)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Cohort &&
        other.id == id &&
        listEquals(other.ranks, ranks) &&
        other.tier == tier;
  }

  @override
  int get hashCode => id.hashCode ^ ranks.hashCode ^ tier.hashCode;
}
