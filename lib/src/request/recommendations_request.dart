// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:duolingo4d/src/adapter/recommendations_adapter.dart';
import 'package:duolingo4d/src/response/recommendations/recommendations_response.dart';
import 'package:http/http.dart' as http;

import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';

class RecommendationsRequest extends Request<RecommendationsResponse> {
  /// Returns the new instance of [RecommendationsRequest] based on an argument.
  RecommendationsRequest.from({
    required this.userId,
  });

  /// The user id
  final String userId;

  /// The response adapter
  static final _adapter = RecommendationsAdapter.newInstance();

  @override
  Future<RecommendationsResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse(
              '${Endpoint.friend.url}/${Resource.recommendations.url}/$userId/recommendations'),
          headers: InternalSession.instance.headers,
        ),
      );
}
