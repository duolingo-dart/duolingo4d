// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/entity/login/authentication_error.dart';
import 'package:duolingo4d/src/entity/response.dart';

export 'package:duolingo4d/src/entity/login/authentication_error.dart';

/// The entity class that represents the result of Duolingo user authentication.
class AuthenticationResult extends Response {
  /// Returns the new instance of [AuthenticationResult] based on arguments.
  AuthenticationResult.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.username,
    required this.userId,
    required this.error,
  }) : super.from(
          statusCode: statusCode,
          reasonPhrase: reasonPhrase,
          headers: headers,
        );

  /// The username
  final String username;

  /// The user id
  final String userId;

  /// The error object
  final AuthenticationError? error;

  /// Returns true if the response has error, otherwise false.
  bool get hasError => error != null;
}
