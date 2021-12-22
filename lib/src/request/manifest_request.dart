// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:duolingo4d/src/adapter/manifest_adapter.dart';
import 'package:duolingo4d/src/response/manifest/manifest_response.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';

class ManifestRequest extends Request<ManifestResponse> {
  /// Returns the new instance of [ManifestRequest].
  ManifestRequest.newInstance();

  /// The response adapter
  static final _adapter = ManifestAdapter.newInstance();

  /// The API uri
  static final _apiUri = Uri.parse(DuolingoApi.manifest.url);

  @override
  Future<ManifestResponse> send() async => _adapter.convert(
        response: await http.get(
          _apiUri,
          headers: InternalSession.instance.headers,
        ),
      );
}
