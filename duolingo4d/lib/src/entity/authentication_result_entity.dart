// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/src/entity/authentication_error_entity.dart';

/// The entity class that represents the result of Duolingo user authentication.
class AuthenticationResultEntity {
  /// Returns the new instance of [AuthenticationResultEntity] based on arguments.
  AuthenticationResultEntity.from({
    required this.username,
    required this.userId,
    this.error,
  });

  /// The username
  final String username;

  /// The user id
  final String userId;

  /// The error
  final AuthenticationErrorEntity? error;

  /// Returns [true] if the response has error, otherwise [false].
  bool get hasError => error != null;
}
