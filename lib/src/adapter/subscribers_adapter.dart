// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/subscribers/subscribers_response.dart';

class SubscribersAdapter extends Adapter<SubscribersResponse> {
  /// Returns the new instance of [SubscribersAdapter].
  SubscribersAdapter.newInstance();

  @override
  SubscribersResponse convert({
    required Response response,
  }) =>
      _buildSubscribersResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  SubscribersResponse _buildSubscribersResponse({
    required Response response,
    required Json json,
  }) =>
      SubscribersResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        followers: _buildFollowers(
          jsonArray: json.getArray(key: 'subscribers'),
        ),
      );

  List<Follower> _buildFollowers({
    required JsonArray jsonArray,
  }) {
    final followers = <Follower>[];
    jsonArray.forEach((json) {
      followers.add(
        Follower.from(
          id: '${json.getInt(key: 'id')}',
          name: json.getString(key: 'name'),
          fullname: json.getString(key: 'username'),
          pictureUrl: json.getString(key: 'picture'),
          weeklyXp: json.getInt(key: 'weeklyXp'),
          monthlyXp: json.getInt(key: 'monthlyXp'),
          totalXp: json.getInt(key: 'totalXp'),
          hasPlus: json.getBool(key: 'hasPlus'),
        ),
      );
    });

    return followers;
  }
}
