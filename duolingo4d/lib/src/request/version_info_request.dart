// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/request.dart';

class VersionInfoRequest extends Request {
  /// The internal constructor for singleton.
  VersionInfoRequest._internal();

  /// Returns the singleton instance of [VersionInfoRequest].
  factory VersionInfoRequest.getInstance() => _singletonInstance;

  /// The API uri
  static final _apiUri = Uri.parse(DuolingoApi.versionInfo.url);

  /// The singleton instance of [VersionInfoRequest].
  static final _singletonInstance = VersionInfoRequest._internal();

  @override
  Future<http.Response> send({
    final params = const <String, String>{},
  }) async =>
      await http.get(_apiUri);
}
