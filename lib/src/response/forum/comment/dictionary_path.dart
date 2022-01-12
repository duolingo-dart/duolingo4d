// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class DictionaryPath {
  /// Returns the new instance of [DictionaryPath] based on arguments.
  DictionaryPath.from({
    required this.word,
    required this.url,
  });

  /// The word
  final String word;

  /// The url
  final String url;

  @override
  String toString() => 'DictionaryPath(word: $word, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DictionaryPath && other.word == word && other.url == url;
  }

  @override
  int get hashCode => word.hashCode ^ url.hashCode;
}
