// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:duolingo4d/src/response/forum/comments/forum_comments_response.dart';
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/forum/comment.dart';
import 'package:duolingo4d/src/response/forum/comment/forum_comment_response.dart';
import 'package:duolingo4d/src/response/forum/user.dart';

class ForumCommentsAdapter extends Adapter<ForumCommentsResponse> {
  /// Returns the new instance of [ForumCommentsAdapter].
  ForumCommentsAdapter.newInstance();

  @override
  ForumCommentsResponse convert({
    required Response response,
  }) =>
      _buildForumCommentsResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  ForumCommentsResponse _buildForumCommentsResponse({
    required Response response,
    required Json json,
  }) =>
      ForumCommentsResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        comments: _buildComments(
          jsonArray: json.getArray(key: 'comments'),
        ),
        hasMore: json.getBool(key: 'more'),
        page: json.getInt(key: 'page'),
      );

  List<Comment> _buildComments({
    required JsonArray jsonArray,
  }) {
    final comments = <Comment>[];
    jsonArray.forEach((json) {
      comments.add(
        Comment.from(
          id: json.getInt(key: 'id'),
          title: json.getString(key: 'title'),
          message: '',
          markdownMessage: '',
          topic: _buildTopic(json: json.get(key: 'topic')),
          user: _buildUser(json: json.get(key: 'user')),
          likes: 0,
          votes: json.getInt(key: 'votes', defaultValue: 0),
          comments: [],
          isUserUpvoted: json.getBool(key: 'user_upvoted'),
          isUserDownvoted: json.getBool(key: 'user_downvoted'),
          isAdmin: false,
          deleted: false,
        ),
      );
    });

    return comments;
  }

  Topic _buildTopic({
    required Json json,
  }) =>
      Topic.from(
        id: json.getInt(key: 'id'),
        name: json.getString(key: 'name'),
        fromLanguage: json.getString(key: 'from_language_abbrev'),
        learningLanguage: json.getString(key: 'learning_language_abbrev'),
      );

  User _buildUser({
    required Json json,
  }) =>
      User.from(
        id: '${json.getInt(key: 'id')}',
        name: json.getString(key: 'username'),
        fullname: json.getString(key: 'fullname'),
        avatarUrl: json.getString(key: 'avatar'),
        isAdmin: json.getBool(key: 'admin'),
      );
}
