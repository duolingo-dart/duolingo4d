// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/duolingo4d.dart';
import 'package:duolingo4d/src/request/login_request.dart';
import 'package:duolingo4d/src/request/overview_request.dart';
import 'package:duolingo4d/src/request/switch_language_request.dart';
import 'package:duolingo4d/src/request/user_request.dart';
import 'package:duolingo4d/src/request/version_info_request.dart';
import 'package:duolingo4d/src/request/word_hint_request.dart';
import 'package:duolingo4d/src/response/login/authentication_result.dart';
import 'package:duolingo4d/src/response/overview/overview.dart';
import 'package:duolingo4d/src/response/user/user.dart';
import 'package:duolingo4d/src/response/versioninfo/version_info.dart';
import 'package:duolingo4d/src/response/wordhint/word_hint.dart';

class DuolingoImpl implements Duolingo {
  /// The internal constructor.
  DuolingoImpl._internal();

  /// Returns the singleton instance of [DuolingoImpl].
  static DuolingoImpl get instance => _singletonInstance;

  /// The singleton instance of this [DuolingoImpl].
  static final _singletonInstance = DuolingoImpl._internal();

  @override
  Future<VersionInfo> versionInfo() async =>
      await VersionInfoRequest.newInstance().send();

  @override
  Future<AuthenticationResult> authenticate({
    required String username,
    required String password,
  }) async =>
      await LoginRequest.from(
        username: username,
        password: password,
      ).send();

  @override
  Future<User> user({
    required String userId,
  }) async =>
      await UserRequest.from(userId: userId).send();

  @override
  Future<Overview> overview() async =>
      await OverviewRequest.newInstance().send();

  @override
  Future<WordHint> wordHint({
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
  Future<SwitchLanguage> switchLanguage({
    required String fromLanguage,
    required String learningLanguage,
  }) async =>
      await SwitchLanguageRequest.from(
        fromLanguage: fromLanguage,
        learningLanguage: learningLanguage,
      ).send();
}
