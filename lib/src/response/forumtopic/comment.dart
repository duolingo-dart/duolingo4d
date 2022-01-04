// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/forumtopic/commented_user.dart';

class Comment {
  /// Returns the new instance of [Comment] based on arguments.
  Comment.from({
    required this.id,
    required this.title,
    required this.commentedUser,
    required this.likes,
    required this.votes,
    required this.isUserUpvoted,
    required this.isUserDownvoted,
  });

  /// The id
  final int id;

  /// The title
  final String title;

  /// The commented user
  final CommentedUser commentedUser;

  /// The number of likes
  final int likes;

  /// The number of votes
  final int votes;

  /// The flag that represents user is upvoted or not
  final bool isUserUpvoted;

  /// The flag that represents user is downvoted or not
  final bool isUserDownvoted;

  @override
  String toString() {
    return 'Comment(id: $id, title: $title, commentedUser: $commentedUser, likes: $likes, votes: $votes, isUserUpvoted: $isUserUpvoted, isUserDownvoted: $isUserDownvoted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Comment &&
        other.id == id &&
        other.title == title &&
        other.commentedUser == commentedUser &&
        other.likes == likes &&
        other.votes == votes &&
        other.isUserUpvoted == isUserUpvoted &&
        other.isUserDownvoted == isUserDownvoted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        commentedUser.hashCode ^
        likes.hashCode ^
        votes.hashCode ^
        isUserUpvoted.hashCode ^
        isUserDownvoted.hashCode;
  }
}
