// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart';

import 'package:duolingo4d/src/response/leaderboard/score.dart';

/// This class represents a ranking in the leaderboard.
class Ranking {
  /// Returns the new instance of [Ranking] based on an argument.
  Ranking.from({
    required this.scores,
  });

  /// The ranking scores
  final List<Score> scores;

  /// Returns new instance of [Ranking] ordered by [Score] name in ascending.
  Ranking orderByScoreNameAsc() => Ranking.from(
        scores: scores.sorted(
          (a, b) => a.userId.compareTo(b.userId),
        ),
      );

  /// Returns new instance of [Ranking] ordered by [Score] name in descending.
  Ranking orderByScoreNameDesc() => Ranking.from(
        scores: scores.sorted(
          (b, a) => a.userId.compareTo(b.userId),
        ),
      );

  /// Returns new instance of [Ranking] ordered by [Score] xp in ascending.
  Ranking orderByScoreXpAsc() => Ranking.from(
        scores: scores.sorted(
          (a, b) => a.xp.compareTo(b.xp),
        ),
      );

  /// Returns new instance of [Ranking] ordered by [Score] xp in descending.
  Ranking orderByScoreXpDesc() => Ranking.from(
        scores: scores.sorted(
          (b, a) => a.xp.compareTo(b.xp),
        ),
      );

  @override
  String toString() => 'Ranking(scores: $scores)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Ranking && listEquals(other.scores, scores);
  }

  @override
  int get hashCode => scores.hashCode;
}
