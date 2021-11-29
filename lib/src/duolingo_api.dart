// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// The enum that manages API.
enum DuolingoApi {
  /// Version Information
  versionInfo,

  /// Login
  login,

  /// User
  user,

  /// Overview
  learnedWord,

  /// Overview Translation
  wordHint,

  /// Switch language
  switchLanguage,
}

/// The extension enum that manages Duolingo API.
extension DuolingoApiExt on DuolingoApi {
  /// Returns the url linked to Duolingo API.
  String get url {
    switch (this) {
      case DuolingoApi.versionInfo:
        return 'https://www.duolingo.com/api/1/version_info';
      case DuolingoApi.login:
        return 'https://www.duolingo.com/login';
      case DuolingoApi.user:
        return 'https://www.duolingo.com/2017-06-30/users';
      case DuolingoApi.learnedWord:
        return 'https://www.duolingo.com/vocabulary/overview';
      case DuolingoApi.wordHint:
        return 'https://d2.duolingo.com/words/hints';
      case DuolingoApi.switchLanguage:
        return 'https://www.duolingo.com/switch_language';
    }
  }
}
