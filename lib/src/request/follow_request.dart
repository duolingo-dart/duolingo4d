// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/src/adapter/follow_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/subscriptions/follow_response.dart';
import 'package:http/http.dart' as http;

class FollowRequest extends Request<FollowResponse> {
  /// Returns the new instance of [FollowRequest] based on arguments.
  FollowRequest.from({
    required this.userId,
    required this.targetUserId,
  });

  /// The response adapter
  static final _adapter = FollowAdapter.newInstance();

  /// The user id
  final String userId;

  /// The target user id
  final String targetUserId;

  @override
  Future<FollowResponse> send() async => _adapter.convert(
        response: await http.put(
          Uri.parse(
            '${Endpoint.base.url}/${Resource.subscriptions.url}/$userId/subscriptions/$targetUserId',
          ),
          headers: InternalSession.instance.headers,
        ),
      );
}
