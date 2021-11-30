// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/entity/response_entity.dart';

class SwitchLanguageEntity extends ResponseEntity {
  /// Returns the new instance of [SwitchLanguageEntity] based on arguments.
  SwitchLanguageEntity.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
  }) : super.from(
          statusCode: statusCode,
          reasonPhrase: reasonPhrase,
          headers: headers,
        );
}
