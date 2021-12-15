// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// The enum that represents Duolingo API.
enum DuolingoApi {
  /// Version Info API
  versionInfo,

  /// Auth API
  auth,

  /// User API
  user,

  /// Overview API
  overview,

  /// Word Hint API
  wordHint,

  /// Switch Language API
  switchLanguage,

  /// Leaderboard API
  leaderboard,

  /// Dictionary API
  dictionary,
}

/// The extension that represents endpoint of Duolingo API.
extension Endpoint on DuolingoApi {
  /// Returns API url.
  String get url {
    switch (this) {
      case DuolingoApi.versionInfo:
        return 'https://www.duolingo.com/api/1/version_info';
      case DuolingoApi.auth:
        return 'https://www.duolingo.com/login';
      case DuolingoApi.user:
        return 'https://www.duolingo.com/2017-06-30/users';
      case DuolingoApi.overview:
        return 'https://www.duolingo.com/vocabulary/overview';
      case DuolingoApi.wordHint:
        return 'https://d2.duolingo.com/words/hints';
      case DuolingoApi.switchLanguage:
        return 'https://www.duolingo.com/switch_language';
      case DuolingoApi.leaderboard:
        return 'https://www.duolingo.com/friendships/leaderboard_activity';
      case DuolingoApi.dictionary:
        return 'https://www.duolingo.com/api/1/dictionary_page';
    }
  }
}
