// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/leaderboard_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/leaderboard/leaderboard_response.dart';

class LeaderboardRequest extends Request<LeaderboardResponse> {
  /// Returns the new instance of [LeaderboardRequest] based on arguments.
  LeaderboardRequest.from({
    required this.userId,
  });

  /// The response adapter
  static final _adapter = LeaderboardAdapter.newInstance();

  /// The user id
  final String userId;

  @override
  Future<LeaderboardResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse(
            '${Endpoint.leaderboard.url}/${Resource.leaderboard.url}/$userId?client_unlocked=true',
          ),
          headers: InternalSession.instance.headers,
        ),
      );
}
