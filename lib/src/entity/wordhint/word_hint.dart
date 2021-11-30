// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/entity/response.dart';
import 'package:duolingo4d/src/entity/wordhint/hint_token.dart';

export 'package:duolingo4d/src/entity/wordhint/hint_token.dart';
export 'package:duolingo4d/src/entity/wordhint/hint_table.dart';
export 'package:duolingo4d/src/entity/wordhint/hint_header.dart';
export 'package:duolingo4d/src/entity/wordhint/hint_row.dart';
export 'package:duolingo4d/src/entity/wordhint/hint_cell.dart';

class WordHint extends Response {
  /// Returns the new instance of [WordHint] based on arguments.
  WordHint.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.tokens,
  }) : super.from(
          statusCode: statusCode,
          reasonPhrase: reasonPhrase,
          headers: headers,
        );

  /// The hint tokens
  final List<HintToken> tokens;
}
