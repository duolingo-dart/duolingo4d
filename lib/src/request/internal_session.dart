// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:authorization_header/authorization_header.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/duolingo_cookie_jar.dart';
import 'package:duolingo4d/src/duolingo_request_header.dart';

/// This class represents an internal session with the Duolingo API.
class InternalSession {
  /// The internal constructor for singleton.
  InternalSession._internal();

  /// The singleton instance of [InternalSession].
  static final _singletonInstance = InternalSession._internal();

  /// Returns the singleton instance of [InternalSession].
  static InternalSession get instance => _singletonInstance;

  /// The request header
  DuolingoRequestHeader _requestHeader = DuolingoRequestHeader.empty();

  /// Returns the copied instance of request header.
  DuolingoRequestHeader get requestHeader => _requestHeader;

  /// Returns http headers
  Map<String, String> get headers => _requestHeader.toMap();

  /// Refreshes the header information in the session using the [response] given as an argument.
  Response refreshRequestHeader({
    required final Response response,
  }) {
    _requestHeader = DuolingoRequestHeader.from(
      cookie: DuolingoCookieJar.from(response: response),
      authHeader: Auth.of().bearer(token: response.headers['jwt'] ?? ''),
    );

    return response;
  }
}
