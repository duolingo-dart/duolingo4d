// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/version_info_api_adapter.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/response/versioninfo/version_info.dart';

class VersionInfoRequest extends Request<VersionInfo> {
  /// Returns the new instance of [VersionInfoRequest].
  VersionInfoRequest.newInstance();

  /// The API uri
  static final _apiUri =
      Uri.parse('https://www.duolingo.com/api/1/version_info');

  @override
  Future<VersionInfo> send() async => VersionInfoAdapter().execute(
        response: await http.get(_apiUri),
      );
}
