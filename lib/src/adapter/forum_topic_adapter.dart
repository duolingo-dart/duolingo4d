// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/forum/comment.dart';
import 'package:duolingo4d/src/response/forum/topic/forum_topic_response.dart';
import 'package:duolingo4d/src/response/forum/topic/subtopic.dart';
import 'package:duolingo4d/src/response/forum/user.dart';

class ForumTopicAdapter extends Adapter<ForumTopicResponse> {
  /// Returns the new instance of [ForumTopicAdapter].
  ForumTopicAdapter.newInstance();

  @override
  ForumTopicResponse convert({
    required Response response,
  }) =>
      _buildForumTopicResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  ForumTopicResponse _buildForumTopicResponse({
    required Response response,
    required Json json,
  }) =>
      ForumTopicResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        id: json.getInt(key: 'id'),
        name: json.getString(key: 'name'),
        description: json.getString(key: 'description'),
        fromLanguage: json.getString(key: 'from_language'),
        learningLanguage: json.getString(key: 'learning_language'),
        skillName: json.getString(key: 'skill_name'),
        includedTopicIds: json.getIntValues(
          key: 'included_topics',
        ),
        troubleshootingId: json.getInt(key: 'troubleshooting_id'),
        isAdmin: json.getBool(key: 'admin_user'),
        isSubscribed: json.getBool(key: 'subscribed'),
        comments: _buildComments(
          jsonArray: json.getArray(key: 'comments'),
        ),
        subtopics: _buildSubtopics(
          jsonArray: json.getArray(key: 'subtopics'),
        ),
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
          message: json.getString(key: 'message'),
          markdownMessage: json.getString(key: 'mark_down_message'),
          user: _buildUser(
            json: json.get(key: 'user'),
          ),
          likes: json.getInt(key: 'love'),
          votes: json.getInt(key: 'votes'),
          isUserUpvoted: json.getBool(key: 'user_upvoted'),
          isUserDownvoted: json.getBool(key: 'user_downvoted'),
          comments: [],
          isAdmin: json.getBool(key: 'user_admin'),
          deleted: json.getBool(key: 'deleted'),
        ),
      );
    });

    return comments;
  }

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

  List<Subtopic> _buildSubtopics({
    required JsonArray jsonArray,
  }) {
    final subtopics = <Subtopic>[];
    jsonArray.forEach((json) {
      subtopics.add(
        Subtopic.from(
          id: json.getInt(key: 'id'),
          name: json.getString(key: 'name'),
          displayName: json.getString(key: 'display_name'),
          fromLanguage: json.getString(key: 'from_language_abbrev'),
          learningLanguage: json.getString(key: 'language_abbrev'),
        ),
      );
    });

    return subtopics;
  }
}
