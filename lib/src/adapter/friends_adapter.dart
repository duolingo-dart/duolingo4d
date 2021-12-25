// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/friends/friends_response.dart';

class FriendsAdapter extends Adapter<FriendsResponse> {
  /// Returns the new instance of [FriendsAdapter].
  FriendsAdapter.newInstance();

  @override
  FriendsResponse convert({
    required Response response,
  }) =>
      _buildFriendsResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  FriendsResponse _buildFriendsResponse({
    required Response response,
    required JsonResponse json,
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
    required List<JsonResponse> jsonList,
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
