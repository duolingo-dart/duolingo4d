// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/unfollow_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/subscriptions/unfollow_response.dart';

class UnfollowRequest extends Request<UnfollowResponse> {
  /// Returns the new instance of [UnfollowRequest] based on arguments.
  UnfollowRequest.from({
    required this.userId,
    required this.targetUserId,
  });

  /// The response adapter
  static final _adapter = UnfollowAdapter.newInstance();

  /// The user id
  final String userId;

  /// The target user id
  final String targetUserId;

  @override
  Future<UnfollowResponse> send() async => _adapter.convert(
        response: await http.delete(
          Uri.parse(
            '${Endpoint.base.url}/${Resource.subscriptions.url}/$userId/subscriptions/$targetUserId',
          ),
          headers: InternalSession.instance.headers,
          body: json.encode(
            {
              'csrfToken': InternalSession
                  .instance.requestHeader.cookie.csrfTokens[1].value,
            },
          ),
        ),
      );
}
