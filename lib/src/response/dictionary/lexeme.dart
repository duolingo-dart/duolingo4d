// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents a lexeme of subject.
class Lexeme {
  /// Returns the new instance of [Lexeme] based on arguments.
  Lexeme.from({
    required this.url,
    required this.abchor,
  });

  /// The url
  final String url;

  /// The anchor
  final String abchor;

  @override
  String toString() => 'Lexeme(url: $url, abchor: $abchor)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Lexeme && other.url == url && other.abchor == abchor;
  }

  @override
  int get hashCode => url.hashCode ^ abchor.hashCode;
}
