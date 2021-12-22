// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/version_info_adapter.dart';
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/response/versioninfo/version_info_response.dart';

/// This class provides the function to send a request
/// to fetch metadata of configuration on Duolingo service.
class VersionInfoRequest extends Request<VersionInfoResponse> {
  /// Returns the new instance of [VersionInfoRequest].
  VersionInfoRequest.newInstance();

  /// The response adapter
  static final _adapter = VersionInfoAdapter.newInstance();

  /// The API uri
  static final _apiUri = Uri.parse(DuolingoApi.versionInfo.url);

  @override
  Future<VersionInfoResponse> send() async => _adapter.convert(
        response: await http.get(_apiUri),
      );
}
