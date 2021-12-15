// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Discussion {
  /// Returns the new instance of [Discussion] based on argument.s
  Discussion.from({
    required this.url,
    required this.numComments,
    required this.anchor,
  });

  /// The url
  final String url;

  /// The number of comments
  final String numComments;

  /// The anchor
  final String anchor;

  @override
  String toString() =>
      'Discussion(url: $url, numComments: $numComments, anchor: $anchor)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Discussion &&
        other.url == url &&
        other.numComments == numComments &&
        other.anchor == anchor;
  }

  @override
  int get hashCode => url.hashCode ^ numComments.hashCode ^ anchor.hashCode;
}
