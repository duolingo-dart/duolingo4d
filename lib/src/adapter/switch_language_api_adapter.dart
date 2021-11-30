// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/entity/switchlanguage/switch_language_entity.dart';

class SwitchLanguageApiAdapter extends Adapter<SwitchLanguageEntity> {
  @override
  SwitchLanguageEntity execute({
    required Response response,
  }) =>
      SwitchLanguageEntity.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
      );
}
