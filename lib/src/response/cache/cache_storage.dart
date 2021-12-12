// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/duolingo4d.dart';
import 'package:duolingo4d/src/response/cache/cache_type.dart';
import 'package:duolingo4d/src/response/cache/duolingo_cache_storage.dart';
import 'package:duolingo4d/src/response/leaderboard/leaderboard_response.dart';

/// This abstract class represents the storage of the cache.
abstract class CacheStorage {
  /// Returns the new instance of [CacheStorage].
  static CacheStorage get instance => DuolingoCacheStorage.open();

  /// Returns cached [VersionInfoResponse].
  VersionInfoResponse? get versionInfoResponse;

  /// Returns cached [UserResponse].
  UserResponse? get userResponse;

  /// Returns cached [OverviewResponse].
  OverviewResponse? get overviewResponse;

  /// Returns cached [WordHintResponse].
  WordHintResponse? get wordHintResponse;

  /// Returns cached [LeaderboardResponse].
  LeaderboardResponse? get leaderboardResponse;

  /// Saves [response] as cache based on [type].
  void save({
    required CacheType type,
    required dynamic response,
  });

  /// Cleans cache based on [type].
  void clean({
    required CacheType type,
  });

  /// Returns true if object linked to [type] is cached, otherwise false.
  bool has({
    required CacheType type,
  });
}
