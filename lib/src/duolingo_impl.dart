// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/duolingo4d.dart';
import 'package:duolingo4d/src/request/auth_request.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/leaderboard_request.dart';
import 'package:duolingo4d/src/request/overview_request.dart';
import 'package:duolingo4d/src/request/switch_language_request.dart';
import 'package:duolingo4d/src/request/user_request.dart';
import 'package:duolingo4d/src/request/version_info_request.dart';
import 'package:duolingo4d/src/request/word_hint_request.dart';
import 'package:duolingo4d/src/response/cache/cache_storage.dart';
import 'package:duolingo4d/src/response/cache/cache_type.dart';
import 'package:duolingo4d/src/response/leaderboard/leaderboard_response.dart';

/// This is an implementation class of [Duolingo].
class DuolingoImpl implements Duolingo {
  /// The internal constructor for singleton.
  DuolingoImpl._internal();

  /// Returns the singleton instance of [DuolingoImpl].
  static DuolingoImpl get instance => _singletonInstance;

  /// The singleton instance of [DuolingoImpl].
  static final _singletonInstance = DuolingoImpl._internal();

  @override
  DuolingoSession get session => DuolingoSession.from(
        requestHeader: InternalSession.instance.requestHeader,
      );

  @override
  Future<VersionInfoResponse> versionInfo() async =>
      await VersionInfoRequest.newInstance().send();

  @override
  Future<AuthResponse> authenticate({
    required String username,
    required String password,
  }) async {
    final response = await AuthRequest.from(
      username: username,
      password: password,
    ).send();

    if (response.hasNotError) {
      // Delete the cache of another user.
      cleanCache();
    }

    return response;
  }

  @override
  Future<UserResponse> user({
    required String userId,
  }) async =>
      await UserRequest.from(userId: userId).send();

  @override
  Future<OverviewResponse> overview() async =>
      await OverviewRequest.newInstance().send();

  @override
  Future<WordHintResponse> wordHint({
    required String fromLanguage,
    required String learningLanguage,
    required String sentence,
  }) async =>
      await WordHintRequest.from(
        fromLanguage: fromLanguage,
        learningLanguage: learningLanguage,
        sentence: sentence,
      ).send();

  @override
  Future<SwitchLanguageResponse> switchLanguage({
    required String fromLanguage,
    required String learningLanguage,
  }) async =>
      await SwitchLanguageRequest.from(
        fromLanguage: fromLanguage,
        learningLanguage: learningLanguage,
      ).send();

  @override
  Future<LeaderboardResponse> leaderboard() async =>
      await LeaderboardRequest.newInstance().send();

  @override
  Future<VersionInfoResponse> cachedVersionInfo() async {
    final cacheStorage = CacheStorage.instance;
    if (cacheStorage.has(type: CacheType.versionInfo)) {
      return cacheStorage.versionInfoResponse!;
    }

    final response = await VersionInfoRequest.newInstance().send();
    cacheStorage.save(type: CacheType.versionInfo, response: response);

    return response;
  }

  @override
  Future<UserResponse> cachedUser({
    required String userId,
  }) async {
    final cacheStorage = CacheStorage.instance;
    if (cacheStorage.has(type: CacheType.user)) {
      return cacheStorage.userResponse!;
    }

    final response = await UserRequest.from(userId: userId).send();
    cacheStorage.save(type: CacheType.user, response: response);

    return response;
  }

  @override
  Future<OverviewResponse> cachedOverview() async {
    final cacheStorage = CacheStorage.instance;
    if (cacheStorage.has(type: CacheType.overview)) {
      return cacheStorage.overviewResponse!;
    }

    final response = await OverviewRequest.newInstance().send();
    cacheStorage.save(type: CacheType.overview, response: response);

    return response;
  }

  @override
  Future<WordHintResponse> cachedWordHint({
    required String fromLanguage,
    required String learningLanguage,
    required String sentence,
  }) async {
    final cacheStorage = CacheStorage.instance;
    if (cacheStorage.has(type: CacheType.wordHint)) {
      return cacheStorage.wordHintResponse!;
    }

    final response = await WordHintRequest.from(
      fromLanguage: fromLanguage,
      learningLanguage: learningLanguage,
      sentence: sentence,
    ).send();

    cacheStorage.save(type: CacheType.wordHint, response: response);

    return response;
  }

  @override
  Future<LeaderboardResponse> cachedLeaderboard() async {
    final cacheStorage = CacheStorage.instance;
    if (cacheStorage.has(type: CacheType.leaderboard)) {
      return cacheStorage.leaderboardResponse!;
    }

    final response = await LeaderboardRequest.newInstance().send();
    cacheStorage.save(type: CacheType.leaderboard, response: response);

    return response;
  }

  @override
  void cleanCache() {
    final cacheStorage = CacheStorage.instance;
    for (final type in CacheType.values) {
      cacheStorage.clean(type: type);
    }
  }

  @override
  void cleanCachedVersionInfo() =>
      CacheStorage.instance.clean(type: CacheType.versionInfo);

  @override
  void cleanCachedUser() => CacheStorage.instance.clean(type: CacheType.user);

  @override
  void cleanCachedOverview() =>
      CacheStorage.instance.clean(type: CacheType.overview);

  @override
  void cleanCachedWordHint() =>
      CacheStorage.instance.clean(type: CacheType.wordHint);

  @override
  void cleanCachedLeaderboard() =>
      CacheStorage.instance.clean(type: CacheType.leaderboard);
}
