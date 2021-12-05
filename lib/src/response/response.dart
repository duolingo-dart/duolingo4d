// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:collection/collection.dart';

import 'package:duolingo4d/src/response/status.dart';

/// This abstract class represents the common elements
/// of the entity objects corresponding to the Duolingo API.
///
/// This abstract class manages the following information.
/// 1. [status]     ->  HTTP status included in the response returned by the API.
/// 2. [headers]    ->  Headers included in the response returned by the API.
///
/// If you want to check the HTTP status and header information of the response
/// after calling a method of `Duolingo4D`, you can refer to the entity object
/// that inherits from this abstract class.
///
/// **_Example:_**
///
/// ```dart
/// void main() async {
///   final duolingo = Duolingo.instance;
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
/// }
/// ```
abstract class Response {
  /// Returns the new instance of [Response] based on arguments.
  Response.from({
    required this.status,
    required this.headers,
  });

  /// The http status
  final Status status;

  /// The http headers
  final Map<String, String> headers;

  @override
  String toString() => 'Response(status: $status, headers: $headers)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other is Response &&
        other.status == status &&
        mapEquals(other.headers, headers);
  }

  @override
  int get hashCode => status.hashCode ^ headers.hashCode;
}
