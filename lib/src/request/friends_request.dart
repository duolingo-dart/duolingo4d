// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/friends_adapter.dart';
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/response/friends/friends_response.dart';

class FriendsRequest extends Request<FriendsResponse> {
  /// Returns the new instance of [FriendsRequest] based on arguments.
  FriendsRequest.from({
    required this.userId,
  });

  /// The response adapter
  static final _adapter = FriendsAdapter.newInstance();

  /// The word id
  final String userId;

  @override
  Future<FriendsResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse('${DuolingoApi.friends.url}/$userId/subscriptions'),
          headers: InternalSession.instance.headers,
        ),
      );
}
