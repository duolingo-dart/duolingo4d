// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/switchlanguage/switch_language_response.dart';

/// This class provides the function to convert the response
/// returned from the switch language API into the [SwitchLanguageResponse] format.
class SwitchLanguageAdapter extends Adapter<SwitchLanguageResponse> {
  /// Returns the new instance of [SwitchLanguageAdapter].
  SwitchLanguageAdapter.newInstance();

  @override
  SwitchLanguageResponse convert({
    required Response response,
  }) =>
      SwitchLanguageResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
      );
}
