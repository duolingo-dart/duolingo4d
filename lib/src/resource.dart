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

  /// Activity API
  activity,

  /// Leaderboard API
  leaderboard,

  /// Dictionary API
  dictionary,

  /// Subscriptions API
  subscriptions,

  /// Shop Items API
  shopItems,

  /// Purchase API
  purchase,

  /// Alphabets API
  alphabets,

  /// Stories API
  stories,
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
      case Resource.subscriptions:
      case Resource.purchase:
        return '2017-06-30/users';
      case Resource.overview:
        return 'vocabulary/overview';
      case Resource.wordHint:
        return 'words/hints';
      case Resource.switchLanguage:
        return 'switch_language';
      case Resource.activity:
        return 'friendships/leaderboard_activity';
      case Resource.leaderboard:
        return 'leaderboards/7d9f5dd1-8423-491a-91f2-2532052038ce/users';
      case Resource.dictionary:
        return 'api/1/dictionary_page';
      case Resource.shopItems:
        return '2017-06-30/shop-items';
      case Resource.alphabets:
        return '2017-06-30/alphabets/courses';
      case Resource.stories:
        return 'api2/stories';
    }
  }
}
