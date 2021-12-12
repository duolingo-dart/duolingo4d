// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/duolingo4d.dart';
import 'package:duolingo4d/src/response/cache/cache_storage.dart';
import 'package:duolingo4d/src/response/cache/cache_type.dart';
import 'package:duolingo4d/src/response/leaderboard/leaderboard_response.dart';

/// This class represents the storage of cache on response object from Duolingo API.
class DuolingoCacheStorage implements CacheStorage {
  /// The internal constructor for singleton.
  DuolingoCacheStorage._internal();

  /// The singleton instance of [DuolingoCacheStorage].
  static final _singletonInstance = DuolingoCacheStorage._internal();

  /// Returns the singleton instance of [DuolingoCacheStorage].
  factory DuolingoCacheStorage.open() => _singletonInstance;

  /// The cached version info response
  VersionInfoResponse? _versionInfoResponse;

  /// The cached user response
  UserResponse? _userResponse;

  /// The cached overview response
  OverviewResponse? _overviewResponse;

  /// The cached word hint response
  WordHintResponse? _wordHintResponse;

  /// The cached leaderboard response
  LeaderboardResponse? _leaderboardResponse;

  @override
  VersionInfoResponse? get versionInfoResponse => _versionInfoResponse;

  @override
  UserResponse? get userResponse => _userResponse;

  @override
  OverviewResponse? get overviewResponse => _overviewResponse;

  @override
  WordHintResponse? get wordHintResponse => _wordHintResponse;

  @override
  LeaderboardResponse? get leaderboardResponse => _leaderboardResponse;

  @override
  void save({
    required CacheType type,
    required dynamic response,
  }) {
    switch (type) {
      case CacheType.versionInfo:
        _versionInfoResponse = response;
        break;
      case CacheType.user:
        _userResponse = response;
        break;
      case CacheType.overview:
        _overviewResponse = response;
        break;
      case CacheType.wordHint:
        _wordHintResponse = response;
        break;
      case CacheType.leaderboard:
        _leaderboardResponse = response;
        break;
    }
  }

  @override
  void clean({
    required CacheType type,
  }) {
    switch (type) {
      case CacheType.versionInfo:
        _versionInfoResponse = null;
        break;
      case CacheType.user:
        _userResponse = null;
        break;
      case CacheType.overview:
        _overviewResponse = null;
        break;
      case CacheType.wordHint:
        _wordHintResponse = null;
        break;
      case CacheType.leaderboard:
        _leaderboardResponse = null;
        break;
    }
  }

  @override
  bool has({
    required CacheType type,
  }) {
    switch (type) {
      case CacheType.versionInfo:
        return _versionInfoResponse != null;
      case CacheType.user:
        return _userResponse != null;
      case CacheType.overview:
        return _overviewResponse != null;
      case CacheType.wordHint:
        return _wordHintResponse != null;
      case CacheType.leaderboard:
        return _leaderboardResponse != null;
    }
  }

  @override
  String toString() {
    return 'DuolingoCacheStorage(_versionInfoResponse: $_versionInfoResponse, _userResponse: $_userResponse, _overviewResponse: $_overviewResponse, _wordHintResponse: $_wordHintResponse, _leaderboardResponse: $_leaderboardResponse)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DuolingoCacheStorage &&
        other._versionInfoResponse == _versionInfoResponse &&
        other._userResponse == _userResponse &&
        other._overviewResponse == _overviewResponse &&
        other._wordHintResponse == _wordHintResponse &&
        other._leaderboardResponse == _leaderboardResponse;
  }

  @override
  int get hashCode {
    return _versionInfoResponse.hashCode ^
        _userResponse.hashCode ^
        _overviewResponse.hashCode ^
        _wordHintResponse.hashCode ^
        _leaderboardResponse.hashCode;
  }
}
