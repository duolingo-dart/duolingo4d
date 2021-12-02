// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';
import 'package:duolingo4d/src/response/wordhint/hint_token.dart';

export 'package:duolingo4d/src/response/wordhint/hint_token.dart';
export 'package:duolingo4d/src/response/wordhint/hint_table.dart';
export 'package:duolingo4d/src/response/wordhint/hint_header.dart';
export 'package:duolingo4d/src/response/wordhint/hint_row.dart';
export 'package:duolingo4d/src/response/wordhint/hint_cell.dart';

/// This class represents the Word Hint API response entity in the Duolingo API.
///
/// In this entity object, the Word Hint API decomposes the word or sentence parameters
/// that are set when sending a request to the Duolingo API into the smallest units
/// that are meaningful as words, and manages the data as [HintToken]. And so
/// in this entity object, [tokens], which is a set of [HintToken], is set.
///
/// Each [HintToken] contains the word or words to be parsed for that token unit.
/// as well as the hint information associated with the word for that token unit.
///
/// For the overall data structure of this entity object please refer to following JSON samples.
/// 1. [English → Japanese](https://github.com/myConsciousness/duolingo4d/blob/main/design/00_api/05_hints/response_ja.json)
/// 2. [Japanese → English](https://github.com/myConsciousness/duolingo4d/blob/main/design/00_api/05_hints/response_en.json)
///
/// **_Example:_**
///
///```dart
///void main() async {
///  final duolingo = Duolingo.instance;
///
///  final wordHintResponse = await duolingo.wordHint(
///    fromLanguage: 'en',
///    learningLanguage: 'es',
///    sentence: 'boligrafos',
///  );
///
///  for (final token in wordHintResponse.tokens) {
///    final headers = token.table.headers;
///    for (final header in headers) {
///      print(header.selected);
///      print(header.token);
///    }
///
///    final rows = token.table.rows;
///    for (final row in rows) {
///      for (final cell in row.cells) {
///        print(cell.hint);
///      }
///    }
///  }
///}
///```
class WordHintResponse extends Response {
  /// Returns the new instance of [WordHintResponse] based on arguments.
  WordHintResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.tokens,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The hint tokens
  final List<HintToken> tokens;
}
