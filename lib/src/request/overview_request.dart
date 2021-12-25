// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/overview_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/overview/overview_response.dart';

/// This class provides the function to send a request
/// to fetch the learned word information of an authenticated user.
///
/// This request requires the user to be authenticated in advance.
class OverviewRequest extends Request<OverviewResponse> {
  /// Returns the new instance of [OverviewRequest].
  OverviewRequest.newInstance();

  /// The response adapter
  static final _adapter = OverviewAdapter.newInstance();

  /// The API uri
  static final _apiUri =
      Uri.parse('${Endpoint.base.url}/${Resource.overview.url}');

  @override
  Future<OverviewResponse> send() async => _adapter.convert(
        response: await http.get(
          _apiUri,
          headers: InternalSession.instance.headers,
        ),
      );
}
