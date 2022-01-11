// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/searchfriend/search_friend_response.dart';

class SearchFriendAdapter extends Adapter<SearchFriendResponse> {
  /// Returns the new instance of [SearchFriendAdapter].
  SearchFriendAdapter.newInstance();

  @override
  SearchFriendResponse convert({
    required Response response,
  }) =>
      _buildResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  /// Returns [SearchFriendResponse] based on [response] and [json].
  SearchFriendResponse _buildResponse({
    required Response response,
    required Json json,
  }) =>
      SearchFriendResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        page: json.getInt(key: 'page'),
        numberOfResults: json.getInt(key: 'num_results'),
        hasMore: json.getBool(key: 'more'),
        users: _buildSearchedUser(
          jsonArray: json.getArray(key: 'users'),
        ),
      );

  List<SearchedUser> _buildSearchedUser({
    required JsonArray jsonArray,
  }) {
    final searchedUsers = <SearchedUser>[];
    jsonArray.forEach((json) {
      searchedUsers.add(
        SearchedUser.from(
          id: '${json.getInt(key: 'id')}',
          name: json.getString(key: 'username'),
          fullname: json.getString(key: 'fullname'),
          learningLanguage: json.getString(key: 'learning_language'),
          avatarUrl: json.getString(key: 'avatar'),
        ),
      );
    });

    return searchedUsers;
  }
}
