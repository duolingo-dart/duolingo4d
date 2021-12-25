// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/activity_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/activity/activity_response.dart';

/// This class provides the function to send a request for user's activity.
class ActivityRequest extends Request<ActivityResponse> {
  /// Returns the new instance of [ActivityRequest].
  ActivityRequest.newInstance();

  /// The response adapter
  static final _adapter = ActivityAdapter.newInstance();

  /// The API uri
  static final _apiUri = Uri.parse(
    '${Endpoint.base.url}/${Resource.activity.url}',
  );

  @override
  Future<ActivityResponse> send() async => _adapter.convert(
        response: await http.get(
          _apiUri,
          headers: InternalSession.instance.headers,
        ),
      );
}
