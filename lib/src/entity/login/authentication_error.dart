// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// The class that represents the error of Duolingo user authentication.
class AuthenticationError {
  /// Returns the new instance of [AuthenticationError] based on arguments.
  AuthenticationError.from({
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
}
