// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// The abstract class that represents that it is an HTTP response entity.
abstract class ResponseEntity {
  /// Returns the new instance of [ResponseEntity] based on arguments.
  ResponseEntity.from({
    required this.statusCode,
    required this.reasonPhrase,
    required this.headers,
  });

  /// The status code of response
  final int statusCode;

  /// The reason phrase about status code
  final String reasonPhrase;

  /// The response headers
  final Map<String, String> headers;
}
