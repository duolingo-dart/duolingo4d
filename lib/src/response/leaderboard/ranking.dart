// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/src/response/leaderboard/ranking_item.dart';

class Ranking {
  /// Returns the new instance of [Ranking] based on an argument.
  Ranking.from({
    required this.rankingItems,
  });

  /// The ranking items
  final List<RankingItem> rankingItems;
}
