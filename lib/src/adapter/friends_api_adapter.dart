// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/friends/friends_response.dart';
import 'package:http/http.dart';
import 'package:json_pro/json_pro.dart';

class FriendsApiAdapter extends Adapter<FriendsResponse> {
  /// Returns the new instance of [FriendsApiAdapter].
  FriendsApiAdapter.newInstance();

  @override
  FriendsResponse convert({
    required Response response,
  }) =>
      _buildFriendsResponse(
        response: response,
        json: Json.fromBytes(bytes: response.bodyBytes),
      );

  FriendsResponse _buildFriendsResponse({
    required Response response,
    required Json json,
  }) =>
      FriendsResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        friends: _buildFriends(
          jsonList: json.getJsonList(key: 'subscriptions'),
        ),
      );

  List<Friend> _buildFriends({
    required List<Json> jsonList,
  }) {
    final friends = <Friend>[];
    for (final json in jsonList) {
      friends.add(
        Friend.from(
          id: '${json.getInt(key: 'id')}',
          username: json.getString(key: 'username'),
          name: json.getString(key: 'name'),
          pictureUrl: json.getString(key: 'picture'),
          weeklyXp: json.getInt(key: 'weeklyXp'),
          monthlyXp: json.getInt(key: 'monthlyXp'),
          totalXp: json.getInt(key: 'totalXp'),
          hasPlus: json.getBool(key: 'hasPlus'),
        ),
      );
    }

    return friends;
  }
}
