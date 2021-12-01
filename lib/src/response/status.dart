// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Status {
  /// Returns the new instance of [Status] based on arguments.
  Status.from({
    required this.code,
    required this.reasonPhrase,
  });

  /// The http status code
  final int code;

  /// The reason phrase for [code]
  final String reasonPhrase;

  /// Returns true if http statuc code is 200, otherwise false.
  bool get isOk => code == 200;

  /// Returns true if http status code is not 200, otherwise false.
  bool get isNotOk => code != 200;

  /// Returns true if http status code is client error, otherwise false.
  bool get isClientError => 400 <= code && code <= 499;

  /// Returns true if http status code is server error, otherwise false.
  bool get isServerError => 500 <= code && code <= 599;
}
