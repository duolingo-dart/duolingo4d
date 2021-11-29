// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/entity/login/authentication_error.dart';
import 'package:duolingo4d/src/entity/login/authentication_result_entity.dart';
import 'package:duolingo4d/src/json_response.dart';

// Project imports:
import 'package:http/http.dart';

class LoginApiAdapter extends Adapter<AuthenticationResultEntity> {
  @override
  Future<AuthenticationResultEntity> execute({
    required Response response,
  }) async {
    final jsonResponseBody = JsonResponse.fromJsonString(value: response.body);

    return AuthenticationResultEntity.from(
      statusCode: response.statusCode,
      reasonPhrase: response.reasonPhrase ?? '',
      headers: response.headers,
      username: jsonResponseBody.getStringValue(key: 'username'),
      userId: jsonResponseBody.getStringValue(key: 'user_id'),
      error: _checkAuthenticationError(jsonResponse: jsonResponseBody),
    );
  }

  /// Checks for the presence of authentication error.
  ///
  /// Returns an object representing the authentication error
  /// if an authentication error exists, otherwise null.
  AuthenticationError? _checkAuthenticationError({
    required JsonResponse jsonResponse,
  }) {
    if (!jsonResponse.containsKey(key: 'failure')) {
      return null;
    }

    return AuthenticationError.from(
      code: jsonResponse.getStringValue(key: 'failure'),
      reason: jsonResponse.getStringValue(key: 'message'),
    );
  }
}
