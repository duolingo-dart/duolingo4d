// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:cache_storage/cache_storage.dart';

// Project imports:
import 'package:duolingo4d/duolingo4d.dart';
import 'package:duolingo4d/src/request/auth_request.dart';
import 'package:duolingo4d/src/request/dictionary_request.dart';
import 'package:duolingo4d/src/request/friends_request.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/leaderboard_request.dart';
import 'package:duolingo4d/src/request/manifest_request.dart';
import 'package:duolingo4d/src/request/overview_request.dart';
import 'package:duolingo4d/src/request/shop_items_request.dart';
import 'package:duolingo4d/src/request/switch_language_request.dart';
import 'package:duolingo4d/src/request/user_request.dart';
import 'package:duolingo4d/src/request/version_info_request.dart';
import 'package:duolingo4d/src/request/word_hint_request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/shopitems/shop_items_response.dart';

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
  Future<ManifestResponse> manifest() async =>
      await ManifestRequest.newInstance().send();

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
  Future<DictionaryResponse> dictionary({
    required String wordId,
  }) async =>
      await DictionaryRequest.from(wordId: wordId).send();

  @override
  Future<FriendsResponse> friends({
    required String userId,
  }) async =>
      await FriendsRequest.from(userId: userId).send();

  @override
  Future<ShopItemsResponse> shopItems() async =>
      await ShopItemsRequest.newInstance().send();

  @override
  Future<ManifestResponse> cachedManifest() async {
    if (_cacheStorage.has(key: Resource.manifest.name)) {
      return _cacheStorage.match(key: Resource.manifest.name);
    }

    final response = await manifest();
    _cacheStorage.save(key: Resource.manifest.name, value: response);

    return response;
  }

  @override
  Future<VersionInfoResponse> cachedVersionInfo() async {
    if (_cacheStorage.has(key: Resource.versionInfo.name)) {
      return _cacheStorage.match(key: Resource.versionInfo.name);
    }

    final response = await versionInfo();
    _cacheStorage.save(key: Resource.versionInfo.name, value: response);

    return response;
  }

  @override
  Future<UserResponse> cachedUser({
    required String userId,
  }) async {
    final cacheSubKeys = [userId];

    if (_cacheStorage.has(key: Resource.user.name, subKeys: cacheSubKeys)) {
      return _cacheStorage.match(
        key: Resource.user.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await user(userId: userId);

    _cacheStorage.save(
      key: Resource.user.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  Future<OverviewResponse> cachedOverview() async {
    if (_cacheStorage.has(key: Resource.overview.name)) {
      return _cacheStorage.match(key: Resource.overview.name);
    }

    final response = await overview();
    _cacheStorage.save(key: Resource.overview.name, value: response);

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
      key: Resource.wordHint.name,
      subKeys: cacheSubKeys,
    )) {
      return _cacheStorage.match(
        key: Resource.wordHint.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await wordHint(
      fromLanguage: fromLanguage,
      learningLanguage: learningLanguage,
      sentence: sentence,
    );

    _cacheStorage.save(
      key: Resource.wordHint.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  Future<LeaderboardResponse> cachedLeaderboard() async {
    if (_cacheStorage.has(key: Resource.leaderboard.name)) {
      return _cacheStorage.match(key: Resource.leaderboard.name);
    }

    final response = await leaderboard();
    _cacheStorage.save(key: Resource.leaderboard.name, value: response);

    return response;
  }

  @override
  Future<DictionaryResponse> cachedDictionary({
    required String wordId,
  }) async {
    final cacheSubKeys = [wordId];
    if (_cacheStorage.has(
      key: Resource.dictionary.name,
      subKeys: cacheSubKeys,
    )) {
      return _cacheStorage.match(
        key: Resource.dictionary.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await dictionary(wordId: wordId);

    _cacheStorage.save(
      key: Resource.dictionary.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  Future<FriendsResponse> cachedFriends({
    required String userId,
  }) async {
    final cacheSubKeys = [userId];
    if (_cacheStorage.has(
      key: Resource.friends.name,
      subKeys: cacheSubKeys,
    )) {
      return _cacheStorage.match(
        key: Resource.friends.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await friends(userId: userId);

    _cacheStorage.save(
      key: Resource.friends.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  Future<ShopItemsResponse> cachedShopItems() async {
    if (_cacheStorage.has(key: Resource.shopItems.name)) {
      return _cacheStorage.match(key: Resource.shopItems.name);
    }

    final response = await shopItems();
    _cacheStorage.save(key: Resource.shopItems.name, value: response);

    return response;
  }

  @override
  void cleanCache() => _cacheStorage.delete();

  @override
  void cleanCachedManifest() =>
      _cacheStorage.deleteBy(key: Resource.manifest.name);

  @override
  void cleanCachedVersionInfo() =>
      _cacheStorage.deleteBy(key: Resource.versionInfo.name);

  @override
  void cleanCachedUser() => _cacheStorage.deleteBy(key: Resource.user.name);

  @override
  void cleanCachedOverview() =>
      _cacheStorage.deleteBy(key: Resource.overview.name);

  @override
  void cleanCachedWordHint() =>
      _cacheStorage.deleteBy(key: Resource.wordHint.name);

  @override
  void cleanCachedLeaderboard() =>
      _cacheStorage.deleteBy(key: Resource.leaderboard.name);

  @override
  void cleanCachedDictionary() =>
      _cacheStorage.deleteBy(key: Resource.dictionary.name);

  @override
  void cleanCachedFriends() =>
      _cacheStorage.deleteBy(key: Resource.friends.name);

  @override
  void cleanCachedShopItems() =>
      _cacheStorage.deleteBy(key: Resource.shopItems.name);
}
