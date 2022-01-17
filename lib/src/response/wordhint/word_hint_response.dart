// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';
import 'package:duolingo4d/src/response/wordhint/hint_token.dart';

export 'package:duolingo4d/src/response/wordhint/hint_cell.dart';
export 'package:duolingo4d/src/response/wordhint/hint_header.dart';
export 'package:duolingo4d/src/response/wordhint/hint_row.dart';
export 'package:duolingo4d/src/response/wordhint/hint_table.dart';
export 'package:duolingo4d/src/response/wordhint/hint_token.dart';

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
//
///  // If you don't like the complex structure described above,
///  // you can convert it to a simpler structure.
///  print(wordHintResponse.prettify());
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

  /// Return this hint table as a simpler structure.
  ///
  /// The Map to be returned is set to the word to be translated as the key,
  /// and the list of translated words as the value.
  Map<String, List<String>> prettify() {
    final prettified = <String, List<String>>{};

    for (final token in tokens) {
      for (final row in token.table.rows) {
        final cells = row.cells;
        for (final cell in cells) {
          final colspan = cell.span;
          final key = colspan > 0
              ? _fetchWordString(token: token).substring(0, colspan)
              : token.value;

          if (prettified.containsKey(key)) {
            final hintsInternal = prettified[key]!;
            final hint = cell.hint;

            if (!hintsInternal.contains(hint)) {
              hintsInternal.add(hint);
            }
          } else {
            prettified[key] = [cell.hint];
          }
        }
      }
    }

    return prettified;
  }

  String _fetchWordString({
    required HintToken token,
  }) {
    final hintTable = token.table;

    if (hintTable.headers.isEmpty) {
      return token.value;
    }

    String wordString = '';
    for (final header in hintTable.headers) {
      wordString += header.token;
    }

    return wordString;
  }

  @override
  String toString() => 'WordHintResponse(tokens: $tokens)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is WordHintResponse && listEquals(other.tokens, tokens);
  }

  @override
  int get hashCode => tokens.hashCode;
}
