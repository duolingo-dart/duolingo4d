// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart';

import 'package:duolingo4d/src/response/leaderboard/rank.dart';

class Cohort {
  /// Returns the new instance of [Cohort] based on arguments.
  Cohort.from({
    required this.id,
    required this.ranks,
    required this.tier,
    required this.creationDate,
  });

  /// The id
  final String id;

  /// The ranks
  final List<Rank> ranks;

  /// The tier
  final int tier;

  /// The creation date
  final String creationDate;

  @override
  String toString() {
    return 'Cohort(id: $id, ranks: $ranks, tier: $tier, creationDate: $creationDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Cohort &&
        other.id == id &&
        listEquals(other.ranks, ranks) &&
        other.tier == tier &&
        other.creationDate == creationDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^ ranks.hashCode ^ tier.hashCode ^ creationDate.hashCode;
  }
}
