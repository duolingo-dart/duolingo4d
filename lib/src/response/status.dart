// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents the HTTP status.
///
/// The detailed HTTP status when HTTP communication is performed can be obtained
/// from [code] or [reasonPhrase], but we have provided a method to easily determine
/// whether HTTP communication succeeded or failed.
///
/// 1. [isOk]
/// 2. [isNotOk]
/// 3. [isClientError]
/// 4. [isServerError]
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

  @override
  String toString() => 'Status(code: $code, reasonPhrase: $reasonPhrase)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Status &&
        other.code == code &&
        other.reasonPhrase == reasonPhrase;
  }

  @override
  int get hashCode => code.hashCode ^ reasonPhrase.hashCode;
}
