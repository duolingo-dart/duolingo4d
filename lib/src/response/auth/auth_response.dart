// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/auth/auth_error.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

export 'package:duolingo4d/src/response/auth/auth_error.dart';

/// This class represents the response entity of the authentication API in the Duolingo API.
///
/// The [error] field is set to an object only if an authentication error has occurred,
/// and null if there is no authentication error. It should be used in the caller's processing,
/// as it provides [hasError] and [hasNotError] methods to safely check
/// for the presence of authentication errors.
///
/// **_Example:_**
///
/// ```dart
/// void main() async {
///   final duolingo = Duolingo.getInstance();
///
///   final authResponse = await duolingo.authenticate(
///     username: 'test_username',
///     password: 'test_password',
///   );
///
///   if (authResponse.status.isNotOk) {
///     authResponse.status.reasonPhrase;
///     authResponse.headers;
///     return;
///   }
///
///   if (authResponse.hasError) {
///     final authError = authResponse.error!;
///     print(authError.code);
///     print(authError.reason);
///
///     authError.isInvalidUser;
///     authError.isInvalidPassword;
///     return;
///   }
/// }
/// ```
class AuthResponse extends Response {
  /// Returns the new instance of [AuthResponse] based on arguments.
  AuthResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.username,
    required this.userId,
    required this.error,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The username
  final String username;

  /// The user id
  final String userId;

  /// The error object
  final AuthError? error;

  /// Returns true if the response has error, otherwise false.
  bool get hasError => error != null;

  /// Returns true if the response has not error, otherwise false.
  bool get hasNotError => error == null;
}
