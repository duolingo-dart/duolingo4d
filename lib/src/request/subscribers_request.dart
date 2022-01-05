// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/subscribers_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/subscribers/subscribers_response.dart';

class SubscribersRequest extends Request<SubscribersResponse> {
  /// Returns the new instance of [SubscribersRequest] based on arguments.
  SubscribersRequest.from({
    required this.userId,
  });

  /// The response adapter
  static final _adapter = SubscribersAdapter.newInstance();

  /// The user id
  final String userId;

  @override
  Future<SubscribersResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse(
            '${Endpoint.base.url}/${Resource.subscribers.url}/$userId/subscribers',
          ),
          headers: InternalSession.instance.headers,
        ),
      );
}
