// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/json.dart';
import 'package:duolingo4d/src/response/auth/auth_error.dart';
import 'package:duolingo4d/src/response/auth/auth_response.dart';

class AuthApiAdapter extends Adapter<AuthResponse> {
  @override
  AuthResponse execute({
    required Response response,
  }) =>
      _buildAuthResponse(
        response: response,
        json: Json.fromJsonString(value: response.body),
      );

  AuthResponse _buildAuthResponse({
    required Response response,
    required Json json,
  }) =>
      AuthResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        username: json.getStringValue(key: 'username'),
        userId: json.getStringValue(key: 'user_id'),
        error: _checkAuthError(json: json),
      );

  /// Checks for the presence of authentication error.
  ///
  /// Returns an object representing the authentication error
  /// if an authentication error exists, otherwise null.
  AuthError? _checkAuthError({
    required Json json,
  }) {
    if (!json.containsKey(key: 'failure')) {
      return null;
    }

    return AuthError.from(
      code: json.getStringValue(key: 'failure'),
      reason: json.getStringValue(key: 'message'),
    );
  }
}
