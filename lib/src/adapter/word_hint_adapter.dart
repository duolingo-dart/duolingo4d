// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/wordhint/word_hint_response.dart';

/// This class provides the function to convert the response
/// returned from the word hint API into the [WordHintResponse] format.
class WordHintAdapter extends Adapter<WordHintResponse> {
  /// Returns the new instance of [WordHintAdapter].
  WordHintAdapter.newInstance();

  @override
  WordHintResponse convert({
    required Response response,
  }) =>
      _buildWordHintResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  /// Returns [WordHintResponse] based on [response] and [json].
  WordHintResponse _buildWordHintResponse({
    required Response response,
    required Json json,
  }) =>
      WordHintResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        tokens: _buildHintTokens(
          jsonArray: json.getArray(key: 'tokens'),
        ),
      );

  /// Returns [HintToken] list based on [jsonList].
  List<HintToken> _buildHintTokens({
    required JsonArray jsonArray,
  }) {
    final hintTokens = <HintToken>[];
    jsonArray.forEach((json) {
      final value = json.getString(key: 'value');

      if (value.trim().isNotEmpty) {
        hintTokens.add(
          HintToken.from(
            index: json.getInt(key: 'index'),
            value: value,
            table: _buildHintTable(
              json: json.get(key: 'hint_table'),
            ),
          ),
        );
      }
    });

    return hintTokens;
  }

  /// Returns [HintTable] based on [json].
  HintTable _buildHintTable({
    required Json json,
  }) =>
      HintTable.from(
        headers: _buildHintHeaders(
          jsonArray: json.getArray(key: 'headers'),
        ),
        rows: _buildHintRows(
          jsonArray: json.getArray(key: 'rows'),
        ),
        references: json.getIntValues(key: 'references'),
      );

  /// Returns [HintHeader] list based on [jsonList].
  List<HintHeader> _buildHintHeaders({
    required JsonArray jsonArray,
  }) {
    final hintHeaders = <HintHeader>[];
    jsonArray.forEach((json) {
      hintHeaders.add(
        HintHeader.from(
          token: json.getString(key: 'token'),
          selected: json.getBool(key: 'selected'),
        ),
      );
    });

    return hintHeaders;
  }

  /// Returns [HintRow] list based on [jsonList].
  List<HintRow> _buildHintRows({
    required JsonArray jsonArray,
  }) {
    final hintRows = <HintRow>[];
    jsonArray.forEach((json) {
      hintRows.add(
        HintRow.from(
          cells: _buildHintCells(
            jsonArray: json.getArray(key: 'cells'),
          ),
        ),
      );
    });

    return hintRows;
  }

  /// Returns [HintCell] list based on [jsonList].
  List<HintCell> _buildHintCells({
    required JsonArray jsonArray,
  }) {
    final hintCells = <HintCell>[];
    jsonArray.forEach((json) {
      if (json.isNotEmpty) {
        hintCells.add(
          HintCell.from(
            hint: json.getString(key: 'hint'),
            span: json.getInt(key: 'colspan'),
          ),
        );
      }
    });

    return hintCells;
  }
}
