// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

enum ForumCommentsSortPattern {
  /// Newest
  newest,

  /// Hot
  hot,

  /// Followed
  followed,
}

extension ForumCommentsSortPatternFeature on ForumCommentsSortPattern {
  String get queryValue {
    switch (this) {
      case ForumCommentsSortPattern.newest:
        return 'new';
      case ForumCommentsSortPattern.hot:
        return 'hot';
      case ForumCommentsSortPattern.followed:
        return 'followed';
    }
  }
}
