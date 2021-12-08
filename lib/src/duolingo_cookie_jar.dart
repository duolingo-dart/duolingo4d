// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:sweet_cookie_jar/sweet_cookie_jar.dart';
import 'package:universal_io/io.dart';

/// This class represents a cookie jar related to the data handled by Duolingo.
class DuolingoCookieJar {
  /// Returns the new instance of [DuolingoCookieJar] based on arguments.
  DuolingoCookieJar.from({
    required Response response,
  }) {
    _cookieJar = SweetCookieJar.from(response: response);
  }

  /// The cookie jar
  late SweetCookieJar _cookieJar;

  /// Returns the raw cookie data.
  String get rawData => _cookieJar.rawData;

  /// Returns the cookie about JWT token.
  Cookie get jwtToken => _cookieJar.find(name: 'jwt_token');

  /// Returns cookies about CSRF tokens.
  List<Cookie> get csrfTokens => _cookieJar.findAll(name: 'csrf_token');

  @override
  String toString() => 'DuolingoCookieJar(cookie: $rawData)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DuolingoCookieJar && other._cookieJar == _cookieJar;
  }

  @override
  int get hashCode => _cookieJar.hashCode;
}
