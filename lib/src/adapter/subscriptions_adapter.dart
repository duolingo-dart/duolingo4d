// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/subscriptions/subscriptions_response.dart';

class SubscriptionsAdapter extends Adapter<SubscriptionsResponse> {
  /// Returns the new instance of [SubscriptionsAdapter].
  SubscriptionsAdapter.newInstance();

  @override
  SubscriptionsResponse convert({
    required Response response,
  }) =>
      _buildSubscriptionsResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  SubscriptionsResponse _buildSubscriptionsResponse({
    required Response response,
    required Json json,
  }) =>
      SubscriptionsResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        followingUsers: _buildFollowingUsers(
          jsonArray: json.getArray(key: 'subscriptions'),
        ),
      );

  List<FollowingUser> _buildFollowingUsers({
    required JsonArray jsonArray,
  }) {
    final followingUsers = <FollowingUser>[];
    jsonArray.forEach((json) {
      followingUsers.add(
        FollowingUser.from(
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
    });

    return followingUsers;
  }
}
