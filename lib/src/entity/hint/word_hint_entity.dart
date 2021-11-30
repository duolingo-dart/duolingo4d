// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/entity/hint/hint_token.dart';
import 'package:duolingo4d/src/entity/response_entity.dart';

export 'package:duolingo4d/src/entity/hint/hint_token.dart';
export 'package:duolingo4d/src/entity/hint/hint_table.dart';
export 'package:duolingo4d/src/entity/hint/hint_header.dart';
export 'package:duolingo4d/src/entity/hint/hint_row.dart';
export 'package:duolingo4d/src/entity/hint/hint_cell.dart';

class WordHintEntity extends ResponseEntity {
  /// Returns the new instance of [WordHintEntity] based on arguments.
  WordHintEntity.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.hintTokens,
  }) : super.from(
          statusCode: statusCode,
          reasonPhrase: reasonPhrase,
          headers: headers,
        );

  /// The hint tokens
  final List<HintToken> hintTokens;
}
