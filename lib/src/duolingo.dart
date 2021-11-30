// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/duolingo_impl.dart';
import 'package:duolingo4d/src/response/login/authentication_result.dart';
import 'package:duolingo4d/src/response/overview/overview.dart';
import 'package:duolingo4d/src/response/switchlanguage/switch_language.dart';
import 'package:duolingo4d/src/response/user/user.dart';
import 'package:duolingo4d/src/response/versioninfo/version_info.dart';
import 'package:duolingo4d/src/response/wordhint/word_hint.dart';

abstract class Duolingo {
  /// The factory constructor.
  factory Duolingo.getInstance() => DuolingoImpl.instance;

  Future<VersionInfo> fetchVersionInfo();

  Future<AuthenticationResult> authenticate({
    required String username,
    required String password,
  });

  Future<User> fetchUser({
    required String userId,
  });

  Future<Overview> fetchOverview();

  Future<WordHint> fetchWordHint({
    required String fromLanguage,
    required String learningLanguage,
    required String sentence,
  });

  Future<SwitchLanguage> switchLanguage({
    required String fromLanguage,
    required String learningLanguage,
  });
}
