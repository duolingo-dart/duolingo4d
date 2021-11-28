// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// The entity class that represents the error of Duolingo user authentication.
class AuthenticationErrorEntity {
  /// Returns the new instance of [AuthenticationErrorEntity] based on arguments.
  AuthenticationErrorEntity.from({
    required this.response,
    required this.reason,
  });

  /// The response
  final String response;

  /// The reason
  final String reason;

  /// Returns [true] if the user does not exist, otherwise [false].
  bool get isInvalidUser => response == 'user_does_not_exist';

  /// Returns [true] if the password is invalid, otherwise [false].
  bool get isInvalidPassword => response == 'invalid_password';
}
