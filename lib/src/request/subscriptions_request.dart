// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/subscriptions_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/subscriptions/subscriptions_response.dart';

class SubscriptionsRequest extends Request<SubscriptionsResponse> {
  /// Returns the new instance of [SubscriptionsRequest] based on arguments.
  SubscriptionsRequest.from({
    required this.userId,
  });

  /// The response adapter
  static final _adapter = SubscriptionsAdapter.newInstance();

  /// The user id
  final String userId;

  @override
  Future<SubscriptionsResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse(
            '${Endpoint.base.url}/${Resource.subscriptions.url}/$userId/subscriptions',
          ),
          headers: InternalSession.instance.headers,
        ),
      );
}
