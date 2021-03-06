// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

enum Endpoint {
  /// Base
  base,

  /// Base Prod
  baseProd,

  /// Dictionary
  dictionary,

  /// Leaderboard
  leaderboard,

  /// Story
  story,

  /// Achievement
  achievement,

  /// Forum
  forum,

  /// Friend
  friend,
}

extension EndpointFeature on Endpoint {
  String get url {
    switch (this) {
      case Endpoint.base:
        return 'https://www.duolingo.com';
      case Endpoint.baseProd:
        return 'https://www-prod.duolingo.com';
      case Endpoint.dictionary:
        return 'https://d2.duolingo.com';
      case Endpoint.leaderboard:
        return 'https://duolingo-leaderboards-prod.duolingo.com';
      case Endpoint.story:
        return 'https://stories.duolingo.com';
      case Endpoint.achievement:
        return 'https://duolingo-achievements-prod.duolingo.com';
      case Endpoint.forum:
        return 'https://forum-api.duolingo.com';
      case Endpoint.friend:
        return 'https://friends-prod.duolingo.com';
    }
  }
}
