// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents an authentication error in the Duolingo API authentication API.
///
/// It provides [isInvalidUser] and [isInvalidPassword] methods
/// to easily check the cause of authentication errors.
class AuthError {
  /// Returns the new instance of [AuthError] based on arguments.
  AuthError.from({
    required this.code,
    required this.reason,
  });

  /// The error code
  final String code;

  /// The error reason
  final String reason;

  /// Returns true if the user does not exist, otherwise false.
  bool get isInvalidUser => code == 'user_does_not_exist';

  /// Returns true] if the password is invalid, otherwise false.
  bool get isInvalidPassword => code == 'invalid_password';

  @override
  String toString() => 'AuthError(code: $code, reason: $reason)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthError && other.code == code && other.reason == reason;
  }

  @override
  int get hashCode => code.hashCode ^ reason.hashCode;
}
