// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:duolingo4d/src/adapter/version_info_api_adapter.dart';
import 'package:duolingo4d/src/entity/version_info_entity.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/request.dart';

class VersionInfoRequest extends Request<VersionInfoEntity> {
  /// Returns the new instance of [VersionInfoRequest].
  VersionInfoRequest.newInstance();

  /// The API uri
  static final _apiUri = Uri.parse(DuolingoApi.versionInfo.url);

  @override
  Future<VersionInfoEntity> send({
    final params = const <String, String>{},
  }) async =>
      await VersionInfoAdapter().execute(
        response: await http.get(_apiUri),
      );
}
