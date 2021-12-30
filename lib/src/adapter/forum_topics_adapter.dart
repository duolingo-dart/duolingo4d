// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/forumtopics/forum_topic.dart';
import 'package:duolingo4d/src/response/forumtopics/forum_topics_response.dart';
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

class ForumTopicsAdapter extends Adapter<ForumTopicsResponse> {
  /// Returns the new instance of [ForumTopicsAdapter].
  ForumTopicsAdapter.newInstance();

  @override
  ForumTopicsResponse convert({
    required Response response,
  }) =>
      _buildForumTopicsResponse(
        response: response,
        jsonArray: super.jsonArrayDecode(response: response),
      );

  ForumTopicsResponse _buildForumTopicsResponse({
    required Response response,
    required JsonArray jsonArray,
  }) =>
      ForumTopicsResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        forumTopics: _buildForumTopics(jsonArray: jsonArray),
      );

  List<ForumTopic> _buildForumTopics({
    required JsonArray jsonArray,
  }) {
    final forumTopics = <ForumTopic>[];
    jsonArray.forEach((json) {
      forumTopics.add(
        ForumTopic.from(
          id: json.getInt(key: 'topic_id'),
          name: json.getString(key: 'name'),
          displayName: json.getString(key: 'display_name'),
          fromLanguage: json.getString(key: 'from_language_abbrev'),
          learningLanguage: json.getString(key: 'language_abbrev'),
          fromLanguageName: json.getString(key: 'from_language_string'),
          learningLanguageName: json.getString(key: 'language_string'),
          isSubscribed: json.getBool(key: 'subscribed'),
        ),
      );
    });

    return forumTopics;
  }
}
