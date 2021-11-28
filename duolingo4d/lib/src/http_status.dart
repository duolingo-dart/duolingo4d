// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class HttpStatus {
  /// Returns the new instance of [HttpStatus] based on [code] passed as an argument.
  HttpStatus.from({
    required this.code,
  });

  /// The status code
  final int code;

  /// Returns [true] if http request is accepted, otherwise [false].
  bool get isAccepted => code == 200;

  /// Returns [true] if there was a client error, otherwise [false].
  bool get isClientError => 400 <= code && code < 500;

  /// Returns [true] if there was a server error, otherwise [false].
  bool get isServerError => 500 <= code && code < 600;
}
