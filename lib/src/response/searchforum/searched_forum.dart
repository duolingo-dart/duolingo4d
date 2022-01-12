// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class SearchedForum {
  /// Returns the new instance of [SearchedForum] based on arguments.
  SearchedForum.from({
    required this.id,
    required this.title,
    required this.message,
    required this.score,
    required this.votes,
    required this.commentType,
    required this.numberOfComments,
    required this.userId,
    required this.topicId,
    required this.topicName,
    required this.createdAt,
  });

  /// The id
  final String id;

  /// The title
  final String title;

  /// The message
  final String message;

  /// The score
  final double score;

  /// The votes
  final int votes;

  /// The comment type
  final String commentType;

  /// The number of comments
  final int numberOfComments;

  /// The user id
  final String userId;

  /// The topic id
  final int topicId;

  /// The topic name
  final String topicName;

  /// The datetime
  final String createdAt;

  @override
  String toString() {
    return 'SearchedForum(id: $id, title: $title, message: $message, score: $score, votes: $votes, commentType: $commentType, numberOfComments: $numberOfComments, userId: $userId, topicId: $topicId, topicName: $topicName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchedForum &&
        other.id == id &&
        other.title == title &&
        other.message == message &&
        other.score == score &&
        other.votes == votes &&
        other.commentType == commentType &&
        other.numberOfComments == numberOfComments &&
        other.userId == userId &&
        other.topicId == topicId &&
        other.topicName == topicName &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        message.hashCode ^
        score.hashCode ^
        votes.hashCode ^
        commentType.hashCode ^
        numberOfComments.hashCode ^
        userId.hashCode ^
        topicId.hashCode ^
        topicName.hashCode ^
        createdAt.hashCode;
  }
}
