// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/manifest/manifest_response.dart';
import 'package:http/http.dart';
import 'package:json_pro/json_pro.dart';

class ManifestAdapter extends Adapter<ManifestResponse> {
  /// Returns the new instance of [ManifestAdapter].
  ManifestAdapter.newInstance();

  @override
  ManifestResponse convert({
    required Response response,
  }) =>
      _buildLeaderboardResponse(
        response: response,
        json: Json.fromBytes(bytes: response.bodyBytes),
      );

  /// Returns [ManifestResponse] based on [response] and [json].
  ManifestResponse _buildLeaderboardResponse({
    required Response response,
    required Json json,
  }) =>
      ManifestResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        name: json.getString(key: 'name'),
        icons: _buildIcons(
          jsonList: json.getJsonList(key: 'icons'),
        ),
        backgroundColor: json.getString(key: 'background_color'),
        themeColor: json.getString(key: 'theme_color'),
      );

  List<Icon> _buildIcons({required List<Json> jsonList}) {
    final icons = <Icon>[];
    for (final json in jsonList) {
      icons.add(
        Icon.from(
          src: json.getString(key: 'src'),
          type: json.getString(key: 'type'),
          sizes: json.getString(
            key: 'sizes',
          ),
        ),
      );
    }

    return icons;
  }
}
