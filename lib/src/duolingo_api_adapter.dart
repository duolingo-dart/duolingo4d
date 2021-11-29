// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/adapter/overview_api_adapter.dart';
import 'package:duolingo4d/src/adapter/login_api_adapter.dart';
import 'package:duolingo4d/src/adapter/switch_language_api_adapter.dart';
import 'package:duolingo4d/src/adapter/user_api_adapter.dart';
import 'package:duolingo4d/src/adapter/version_info_api_adapter.dart';
import 'package:duolingo4d/src/adapter/word_hint_api_adapter.dart';

/// The enum that manages API adapter.
enum DuolingoApiAdapter {
  versionInfo,
  login,
  user,
  overview,
  hint,
  switchLanguage,
}

extension DuolingoApiAdapterExt on DuolingoApiAdapter {
  Adapter get build {
    switch (this) {
      case DuolingoApiAdapter.versionInfo:
        return VersionInfoAdapter();
      case DuolingoApiAdapter.login:
        return LoginApiAdapter();
      case DuolingoApiAdapter.user:
        return UserApiAdapter();
      case DuolingoApiAdapter.overview:
        return OverviewApiAdapter();
      case DuolingoApiAdapter.hint:
        return WordHintApiAdapter();
      case DuolingoApiAdapter.switchLanguage:
        return SwitchLanguageApiAdapter();
    }
  }
}
