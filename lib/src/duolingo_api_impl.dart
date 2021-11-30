// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/duolingo4d.dart';
import 'package:duolingo4d/src/entity/hint/word_hint_entity.dart';
import 'package:duolingo4d/src/entity/login/authentication_result_entity.dart';
import 'package:duolingo4d/src/entity/overview/overview_entity.dart';
import 'package:duolingo4d/src/entity/versioninfo/version_info_entity.dart';
import 'package:duolingo4d/src/request/login_request.dart';
import 'package:duolingo4d/src/request/overview_request.dart';
import 'package:duolingo4d/src/request/version_info_request.dart';
import 'package:duolingo4d/src/request/word_hint_request.dart';

class DuolingoApiImpl implements DuolingoApi {
  @override
  Future<VersionInfoEntity> fetchVersionInfo() async =>
      await VersionInfoRequest.newInstance().send();

  @override
  Future<AuthenticationResultEntity> login({
    required String username,
    required String password,
  }) async =>
      await LoginRequest.from(
        username: username,
        password: password,
      ).send();

  @override
  Future<OverviewEntity> fetchOverview() async =>
      await OverviewRequest.newInstance().send();

  @override
  Future<WordHintEntity> fetchWordHint({
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
