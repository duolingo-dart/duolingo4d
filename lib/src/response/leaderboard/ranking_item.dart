// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class RankingItem {
  /// Returns the new instance of [RankingItem] based on arguments.
  RankingItem.from({
    required this.userId,
    required this.score,
  });

  /// The user id
  final String userId;

  /// The score
  final int score;
}
