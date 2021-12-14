// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:cache_storage/cache_storage.dart';

// Project imports:
import 'package:duolingo4d/duolingo4d.dart';
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/auth_request.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/leaderboard_request.dart';
import 'package:duolingo4d/src/request/overview_request.dart';
import 'package:duolingo4d/src/request/switch_language_request.dart';
import 'package:duolingo4d/src/request/user_request.dart';
import 'package:duolingo4d/src/request/version_info_request.dart';
import 'package:duolingo4d/src/request/word_hint_request.dart';
import 'package:duolingo4d/src/response/leaderboard/leaderboard_response.dart';

/// This is an implementation class of [Duolingo].
class DuolingoImpl implements Duolingo {
  /// The internal constructor for singleton.
  DuolingoImpl._internal();

  /// Returns the singleton instance of [DuolingoImpl].
  static DuolingoImpl get instance => _singletonInstance;

  /// The singleton instance of [DuolingoImpl].
  static final _singletonInstance = DuolingoImpl._internal();

  /// The cache storage
  static final _cacheStorage = CacheStorage.open();

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
    if (_cacheStorage.has(key: DuolingoApi.versionInfo.name)) {
      return _cacheStorage.match(key: DuolingoApi.versionInfo.name);
    }

    final response = await VersionInfoRequest.newInstance().send();
    _cacheStorage.save(key: DuolingoApi.versionInfo.name, value: response);

    return response;
  }

  @override
  Future<UserResponse> cachedUser({
    required String userId,
  }) async {
    final cacheSubKeys = [userId];

    if (_cacheStorage.has(key: DuolingoApi.user.name, subKeys: cacheSubKeys)) {
      return _cacheStorage.match(
        key: DuolingoApi.user.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await UserRequest.from(userId: userId).send();

    _cacheStorage.save(
      key: DuolingoApi.user.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  Future<OverviewResponse> cachedOverview() async {
    if (_cacheStorage.has(key: DuolingoApi.overview.name)) {
      return _cacheStorage.match(key: DuolingoApi.overview.name);
    }

    final response = await OverviewRequest.newInstance().send();
    _cacheStorage.save(key: DuolingoApi.overview.name, value: response);

    return response;
  }

  @override
  Future<WordHintResponse> cachedWordHint({
    required String fromLanguage,
    required String learningLanguage,
    required String sentence,
  }) async {
    final cacheSubKeys = <String>[
      fromLanguage,
      learningLanguage,
      sentence,
    ];

    if (_cacheStorage.has(
      key: DuolingoApi.wordHint.name,
      subKeys: cacheSubKeys,
    )) {
      return _cacheStorage.match(
        key: DuolingoApi.wordHint.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await WordHintRequest.from(
      fromLanguage: fromLanguage,
      learningLanguage: learningLanguage,
      sentence: sentence,
    ).send();

    _cacheStorage.save(
      key: DuolingoApi.wordHint.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  Future<LeaderboardResponse> cachedLeaderboard() async {
    if (_cacheStorage.has(key: DuolingoApi.leaderboard.name)) {
      return _cacheStorage.match(key: DuolingoApi.leaderboard.name);
    }

    final response = await LeaderboardRequest.newInstance().send();
    _cacheStorage.save(key: DuolingoApi.leaderboard.name, value: response);

    return response;
  }

  @override
  void cleanCache() => _cacheStorage.delete();

  @override
  void cleanCachedVersionInfo() =>
      _cacheStorage.deleteBy(key: DuolingoApi.versionInfo.name);

  @override
  void cleanCachedUser() => _cacheStorage.deleteBy(key: DuolingoApi.user.name);

  @override
  void cleanCachedOverview() =>
      _cacheStorage.deleteBy(key: DuolingoApi.overview.name);

  @override
  void cleanCachedWordHint() =>
      _cacheStorage.deleteBy(key: DuolingoApi.wordHint.name);

  @override
  void cleanCachedLeaderboard() =>
      _cacheStorage.deleteBy(key: DuolingoApi.leaderboard.name);
}
