// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/entity/login/authentication_error.dart';
import 'package:duolingo4d/src/entity/login/authentication_result.dart';
import 'package:duolingo4d/src/json.dart';

class LoginApiAdapter extends Adapter<AuthenticationResult> {
  @override
  AuthenticationResult execute({
    required Response response,
  }) =>
      _buildAuthenticationResultEntity(
        response: response,
        json: Json.fromJsonString(value: response.body),
      );

  AuthenticationResult _buildAuthenticationResultEntity({
    required Response response,
    required Json json,
  }) =>
      AuthenticationResult.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        username: json.getStringValue(key: 'username'),
        userId: json.getStringValue(key: 'user_id'),
        error: _checkAuthenticationError(json: json),
      );

  /// Checks for the presence of authentication error.
  ///
  /// Returns an object representing the authentication error
  /// if an authentication error exists, otherwise null.
  AuthenticationError? _checkAuthenticationError({
    required Json json,
  }) {
    if (!json.containsKey(key: 'failure')) {
      return null;
    }

    return AuthenticationError.from(
      code: json.getStringValue(key: 'failure'),
      reason: json.getStringValue(key: 'message'),
    );
  }
}
