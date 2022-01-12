// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/forum/comment.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

class ForumCommentsResponse extends Response {
  /// Returns the new instance of [ForumCommentsResponse] based on arguments.
  ForumCommentsResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.comments,
    required this.hasMore,
    required this.page,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The comments
  final List<Comment> comments;

  /// The flag that represents this comment has more pages or not
  final bool hasMore;

  /// The page
  final int page;

  @override
  String toString() =>
      'ForumCommentsResponse(comments: $comments, hasMore: $hasMore, page: $page)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ForumCommentsResponse &&
        listEquals(other.comments, comments) &&
        other.hasMore == hasMore &&
        other.page == page;
  }

  @override
  int get hashCode => comments.hashCode ^ hasMore.hashCode ^ page.hashCode;
}
