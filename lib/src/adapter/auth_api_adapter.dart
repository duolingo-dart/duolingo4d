// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_pro/json_pro.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/auth/auth_response.dart';

/// This class provides the function to convert the response
/// returned from the authentication API into the [AuthResponse] format.
class AuthApiAdapter extends Adapter<AuthResponse> {
  /// Returns the new instance of [AuthApiAdapter].
  AuthApiAdapter.newInstance();

  @override
  AuthResponse convert({
    required Response response,
  }) =>
      _buildAuthResponse(
        response: response,
        json: Json.fromBytes(bytes: response.bodyBytes),
      );

  /// Returns [AuthResponse] based on [response] and [json].
  AuthResponse _buildAuthResponse({
    required Response response,
    required Json json,
  }) =>
      AuthResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        username: json.getString(key: 'username'),
        userId: json.getString(key: 'user_id'),
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
      code: json.getString(key: 'failure'),
      reason: json.getString(key: 'message'),
    );
  }
}
