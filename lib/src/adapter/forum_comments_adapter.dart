// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/forum/comment.dart';
import 'package:duolingo4d/src/response/forum/comments/forum_comments_response.dart';
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
        id: json.getInt(key: 'id'),
        title: json.getString(key: 'title'),
        category: json.getString(key: 'category'),
        message: json.getString(key: 'message'),
        markdownMessage: json.getString(key: 'marked_down_message'),
        translationId: json.getString(key: 'translation_id'),
        translation: json.getString(key: 'translation'),
        translationLanguage: json.getString(key: 'translation_language'),
        ttsUrl: json.getString(key: 'tts_url'),
        canonicalUrl: json.getString(key: 'canonical_url'),
        likes: json.getInt(key: 'love'),
        votes: json.getInt(key: 'votes'),
        comments: _buildComments(
          jsonArray: json.getArray(key: 'comments'),
        ),
        parentsTopics: _buildTopics(
          jsonArray: json.getArray(key: 'parents'),
        ),
        rootTopic: _buildTopic(json: json.get(key: 'root')),
        topic: _buildTopic(json: json.get(key: 'topic')),
        dictionaryPaths: _buildDictionaryPaths(
          json: json.get(key: 'word_to_dictionary_url'),
        ),
        user: _buildUser(json: json.get(key: 'user')),
        isUserUpvoted: json.getBool(key: 'user_upvoted'),
        isUserDownvoted: json.getBool(key: 'user_downvoted'),
        isAdmin: json.getBool(key: 'admin_user'),
        deleted: json.getBool(key: 'deleted'),
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
          markdownMessage: json.getString(key: 'marked_down_message'),
          user: _buildUser(json: json.get(key: 'user')),
          likes: json.getInt(key: 'love'),
          votes: json.getInt(key: 'votes'),
          comments: _buildComments(
            jsonArray: json.getArray(key: 'comments'),
          ),
          isUserUpvoted: json.getBool(key: 'user_upvoted'),
          isUserDownvoted: json.getBool(key: 'user_downvoted'),
          isAdmin: json.getBool(key: 'admin_user'),
          deleted: json.getBool(key: 'deleted'),
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

  List<Topic> _buildTopics({
    required JsonArray jsonArray,
  }) {
    final topics = <Topic>[];
    jsonArray.forEach((json) {
      topics.add(
        _buildTopic(json: json),
      );
    });

    return topics;
  }

  List<DictionaryPath> _buildDictionaryPaths({
    required Json json,
  }) {
    final dictionaryPaths = <DictionaryPath>[];
    json.forEach((key, value) {
      dictionaryPaths.add(
        DictionaryPath.from(
          word: key,
          url: value,
        ),
      );
    });

    return dictionaryPaths;
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
}
