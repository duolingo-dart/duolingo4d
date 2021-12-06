// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

/// This class represents a session with the Duolingo API.
class Session {
  /// The internal constructor for singleton.
  Session._internal();

  /// The singleton instance of [Session].
  static final _singletonInstance = Session._internal();

  /// The headers for cookie
  final _headers = <String, String>{};

  /// Returns the singleton instance of [Session].
  static get instance => _singletonInstance;

  /// Returns http headers
  Map<String, String> get headers => Map.from(_headers);

  /// Refreshes the header information in the session using the [response] given as an argument.
  Response refreshRequestHeader({
    required final Response response,
  }) {
    _headers['Cookie'] = response.headers['set-cookie'] ?? '';
    _headers['Authorization'] = 'Bearer ${response.headers['jwt'] ?? ''}';
    return response;
  }
}
