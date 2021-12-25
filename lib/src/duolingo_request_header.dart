// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:authorization_header/authorization_header.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/duolingo_cookie_jar.dart';

/// This class represents the request header when communicating with the Duolingo API.
class DuolingoRequestHeader {
  /// Returns the new instance of [DuolingoRequestHeader] based on arguments.
  DuolingoRequestHeader.from({
    required this.cookie,
    required this.authHeader,
  });

  /// Returns the empty [DuolingoRequestHeader].
  factory DuolingoRequestHeader.empty() => DuolingoRequestHeader.from(
        cookie: DuolingoCookieJar.from(
          response: Response.bytes([], 200),
        ),
        authHeader: AuthHeader.from(
          name: '',
          value: '',
        ),
      );

  /// The cookie
  final DuolingoCookieJar cookie;

  /// The authorization header
  final AuthHeader authHeader;

  /// Returns this [DuolingoRequestHeader] as a map format.
  Map<String, String> toMap() => {
        'Cookie': cookie.rawData,
        authHeader.name: authHeader.value,
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  @override
  String toString() =>
      'DuolingoRequestHeader(cookie: $cookie, authHeader: $authHeader)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DuolingoRequestHeader &&
        other.cookie == cookie &&
        other.authHeader == authHeader;
  }

  @override
  int get hashCode => cookie.hashCode ^ authHeader.hashCode;
}
