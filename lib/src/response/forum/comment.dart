// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/forum/user.dart';

class Comment {
  /// Returns the new instance of [Comment] based on arguments.
  Comment.from({
    required this.id,
    required this.title,
    required this.message,
    required this.markdownMessage,
    required this.user,
    required this.likes,
    required this.votes,
    required this.comments,
    required this.isUserUpvoted,
    required this.isUserDownvoted,
    required this.isAdmin,
    required this.deleted,
  });

  /// The id
  final int id;

  /// The title
  final String title;

  /// The message
  final String message;

  /// The markdown message
  final String markdownMessage;

  /// The user
  final User user;

  /// The number of likes
  final int likes;

  /// The number of votes
  final int votes;

  /// The comments
  final List<Comment> comments;

  /// The flag that represents user is upvoted or not
  final bool isUserUpvoted;

  /// The flag that represents user is downvoted or not
  final bool isUserDownvoted;

  /// The flag that represents this user is admin or not
  final bool isAdmin;

  /// The flag that represents this comment is deleted or not
  final bool deleted;

  @override
  String toString() {
    return 'Comment(id: $id, title: $title, message: $message, markdownMessage: $markdownMessage, user: $user, likes: $likes, votes: $votes, comments: $comments, isUserUpvoted: $isUserUpvoted, isUserDownvoted: $isUserDownvoted, isAdmin: $isAdmin, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Comment &&
        other.id == id &&
        other.title == title &&
        other.message == message &&
        other.markdownMessage == markdownMessage &&
        other.user == user &&
        other.likes == likes &&
        other.votes == votes &&
        listEquals(other.comments, comments) &&
        other.isUserUpvoted == isUserUpvoted &&
        other.isUserDownvoted == isUserDownvoted &&
        other.isAdmin == isAdmin &&
        other.deleted == deleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        message.hashCode ^
        markdownMessage.hashCode ^
        user.hashCode ^
        likes.hashCode ^
        votes.hashCode ^
        comments.hashCode ^
        isUserUpvoted.hashCode ^
        isUserDownvoted.hashCode ^
        isAdmin.hashCode ^
        deleted.hashCode;
  }
}
