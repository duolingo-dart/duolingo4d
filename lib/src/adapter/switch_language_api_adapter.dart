// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/switchlanguage/switch_language.dart';

class SwitchLanguageApiAdapter extends Adapter<SwitchLanguage> {
  @override
  SwitchLanguage execute({
    required Response response,
  }) =>
      SwitchLanguage.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
      );
}
