// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/overview_api_adapter.dart';
import 'package:duolingo4d/src/entity/overview/overview_entity.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/session.dart';

class OverviewRequest extends Request<OverviewEntity> {
  /// Returns the new instance of [OverviewRequest].
  OverviewRequest.newInstance();

  /// The API uri
  static final _apiUri =
      Uri.parse('https://www.duolingo.com/vocabulary/overview');

  /// The session
  static final _session = Session.getInstance();

  @override
  Future<OverviewEntity> send({
    final params = const <String, String>{},
  }) async =>
      OverviewApiAdapter().execute(
        response: await http.get(
          _apiUri,
          headers: _session.headers,
        ),
      );
}
