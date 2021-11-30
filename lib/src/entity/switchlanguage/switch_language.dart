// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/entity/response.dart';

class SwitchLanguage extends Response {
  /// Returns the new instance of [SwitchLanguage] based on arguments.
  SwitchLanguage.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
  }) : super.from(
          statusCode: statusCode,
          reasonPhrase: reasonPhrase,
          headers: headers,
        );
}
