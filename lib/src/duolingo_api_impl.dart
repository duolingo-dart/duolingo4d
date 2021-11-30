// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/duolingo4d.dart';
import 'package:duolingo4d/src/entity/login/authentication_result.dart';
import 'package:duolingo4d/src/entity/overview/overview.dart';
import 'package:duolingo4d/src/entity/user/user.dart';
import 'package:duolingo4d/src/entity/versioninfo/version_info.dart';
import 'package:duolingo4d/src/entity/wordhint/word_hint.dart';
import 'package:duolingo4d/src/request/login_request.dart';
import 'package:duolingo4d/src/request/overview_request.dart';
import 'package:duolingo4d/src/request/user_request.dart';
import 'package:duolingo4d/src/request/version_info_request.dart';
import 'package:duolingo4d/src/request/word_hint_request.dart';

class DuolingoApiImpl implements DuolingoApi {
  /// The internal constructor.
  DuolingoApiImpl._internal();

  /// Returns the singleton instance of [DuolingoApiImpl].
  static DuolingoApiImpl get instance => _singletonInstance;

  /// The singleton instance of this [DuolingoApiImpl].
  static final _singletonInstance = DuolingoApiImpl._internal();

  @override
  Future<VersionInfo> fetchVersionInfo() async =>
      await VersionInfoRequest.newInstance().send();

  @override
  Future<AuthenticationResult> login({
    required String username,
    required String password,
  }) async =>
      await LoginRequest.from(
        username: username,
        password: password,
      ).send();

  @override
  Future<User> fetchUser({
    required String userId,
  }) async =>
      await UserRequest.from(userId: userId).send();

  @override
  Future<Overview> fetchOverview() async =>
      await OverviewRequest.newInstance().send();

  @override
  Future<WordHint> fetchWordHint({
    required String fromLanguage,
    required String learningLanguage,
    required String sentence,
  }) async =>
      await WordHintRequest.from(
        fromLanguage: fromLanguage,
        learningLanguage: learningLanguage,
        sentence: sentence,
      ).send();
}
