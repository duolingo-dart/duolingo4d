// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/recommendations/recommended_user.dart';

class Recommendation {
  /// Returns the new instance of [Recommendation] based on arguments.
  Recommendation.from({
    required this.userId,
    required this.score,
    required this.reason,
    required this.reasonPhrase,
    required this.user,
  });

  /// The user id
  final String userId;

  /// The score
  final double score;

  /// The reason
  final String reason;

  /// The reason phrase
  final String reasonPhrase;

  /// The recommended user
  final RecommendedUser user;

  @override
  String toString() {
    return 'Recommendation(userId: $userId, score: $score, reason: $reason, reasonPhrase: $reasonPhrase, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Recommendation &&
        other.userId == userId &&
        other.score == score &&
        other.reason == reason &&
        other.reasonPhrase == reasonPhrase &&
        other.user == user;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        score.hashCode ^
        reason.hashCode ^
        reasonPhrase.hashCode ^
        user.hashCode;
  }
}
