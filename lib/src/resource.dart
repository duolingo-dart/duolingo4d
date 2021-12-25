// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

enum Resource {
  /// Manifest API
  manifest,

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

  /// Friends API
  friends,

  /// Shop Items API
  shopItems,
}

extension ReourceFeature on Resource {
  /// Returns resource url.
  String get url {
    switch (this) {
      case Resource.manifest:
        return 'manifest.json';
      case Resource.versionInfo:
        return 'api/1/version_info';
      case Resource.auth:
        return 'login';
      case Resource.user:
      case Resource.friends:
        return '2017-06-30/users';
      case Resource.overview:
        return 'vocabulary/overview';
      case Resource.wordHint:
        return 'words/hints';
      case Resource.switchLanguage:
        return 'switch_language';
      case Resource.leaderboard:
        return 'friendships/leaderboard_activity';
      case Resource.dictionary:
        return 'api/1/dictionary_page';
      case Resource.shopItems:
        return '2017-06-30/shop-items';
    }
  }
}
