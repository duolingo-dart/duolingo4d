// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:duolingo4d/src/response/searchforum/search_forum_response.dart';
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';

class SearchForumAdapter extends Adapter<SearchForumResponse> {
  /// Returns the new instance of [SearchForumAdapter].
  SearchForumAdapter.newInstance();

  @override
  SearchForumResponse convert({
    required Response response,
  }) =>
      _buildResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  /// Returns [SearchForumResponse] based on [response] and [json].
  SearchForumResponse _buildResponse({
    required Response response,
    required Json json,
  }) =>
      SearchForumResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        forums: _buildSearchedForums(
          jsonArray: json.getArray(key: 'results'),
        ),
      );

  List<SearchedForum> _buildSearchedForums({
    required JsonArray jsonArray,
  }) {
    final forums = <SearchedForum>[];
    jsonArray.forEach((json) {
      forums.add(
        SearchedForum.from(
          id: json.getString(key: 'id'),
          title: json.getString(key: 'title'),
          message: json.getString(key: 'message'),
          score: json.getDouble(key: 'score'),
          votes: json.getInt(key: 'votes'),
          commentType: json.getString(key: 'comment_type'),
          numberOfComments: json.getInt(key: 'num_comments'),
          userId: '${json.getInt(key: 'user_id')}',
          topicId: json.getInt(key: 'topic_id'),
          topicName: json.getString(key: 'topic_name'),
          createdAt: json.getString(key: 'datetime'),
        ),
      );
    });

    return forums;
  }
}
