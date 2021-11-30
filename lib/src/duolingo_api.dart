// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/duolingo_api_impl.dart';
import 'package:duolingo4d/src/entity/hint/word_hint_entity.dart';
import 'package:duolingo4d/src/entity/login/authentication_result_entity.dart';
import 'package:duolingo4d/src/entity/overview/overview_entity.dart';
import 'package:duolingo4d/src/entity/versioninfo/version_info_entity.dart';

abstract class DuolingoApi {
  /// The factory constructor.
  factory DuolingoApi() => DuolingoApiImpl();

  Future<VersionInfoEntity> fetchVersionInfo();

  Future<AuthenticationResultEntity> login({
    required String username,
    required String password,
  });

  Future<OverviewEntity> fetchOverview();

  Future<WordHintEntity> fetchWordHint({
    required String fromLanguage,
    required String learningLanguage,
    required String sentence,
  });
}
