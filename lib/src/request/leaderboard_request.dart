// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/leaderboard_api_adapter.dart';
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/response/leaderboard/leaderboard_response.dart';

/// This class provides the function to send a request for user's leaderboard.
class LeaderboardRequest extends Request<LeaderboardResponse> {
  /// Returns the new instance of [LeaderboardRequest].
  LeaderboardRequest.newInstance();

  /// The response adapter
  static final _adapter = LeaderboardApiAdapter.newInstance();

  /// The API uri
  static final _apiUri = Uri.parse(DuolingoApi.leaderboard.url);

  @override
  Future<LeaderboardResponse> send() async => _adapter.convert(
        response: await http.get(
          _apiUri,
          headers: InternalSession.instance.headers,
        ),
      );
}
