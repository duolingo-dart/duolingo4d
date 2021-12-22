// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_pro/json_pro.dart';

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
        json: Json.fromBytes(bytes: response.bodyBytes),
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
          jsonList: json.getJsonList(key: 'tokens'),
        ),
      );

  /// Returns [HintToken] list based on [jsonList].
  List<HintToken> _buildHintTokens({
    required List<Json> jsonList,
  }) {
    final hintTokens = <HintToken>[];

    for (final json in jsonList) {
      final value = json.getString(key: 'value');

      if (value.trim().isEmpty) {
        continue;
      }

      hintTokens.add(
        HintToken.from(
          index: json.getInt(key: 'index'),
          value: value,
          table: _buildHintTable(
            json: json.getJson(key: 'hint_table'),
          ),
        ),
      );
    }

    return hintTokens;
  }

  /// Returns [HintTable] based on [json].
  HintTable _buildHintTable({
    required Json json,
  }) =>
      HintTable.from(
        headers: _buildHintHeaders(
          jsonList: json.getJsonList(key: 'headers'),
        ),
        rows: _buildHintRows(
          jsonList: json.getJsonList(key: 'rows'),
        ),
        references: json.getIntValues(key: 'references'),
      );

  /// Returns [HintHeader] list based on [jsonList].
  List<HintHeader> _buildHintHeaders({
    required List<Json> jsonList,
  }) {
    final hintHeaders = <HintHeader>[];

    for (final json in jsonList) {
      hintHeaders.add(
        HintHeader.from(
          token: json.getString(key: 'token'),
          selected: json.getBool(key: 'selected'),
        ),
      );
    }

    return hintHeaders;
  }

  /// Returns [HintRow] list based on [jsonList].
  List<HintRow> _buildHintRows({
    required List<Json> jsonList,
  }) {
    final hintRows = <HintRow>[];

    for (final json in jsonList) {
      hintRows.add(
        HintRow.from(
          cells: _buildHintCells(
            jsonList: json.getJsonList(key: 'cells'),
          ),
        ),
      );
    }

    return hintRows;
  }

  /// Returns [HintCell] list based on [jsonList].
  List<HintCell> _buildHintCells({
    required List<Json> jsonList,
  }) {
    final hintCells = <HintCell>[];

    for (final json in jsonList) {
      if (json.isEmpty) {
        continue;
      }

      hintCells.add(
        HintCell.from(
          hint: json.getString(key: 'hint'),
          span: json.getInt(key: 'colspan'),
        ),
      );
    }

    return hintCells;
  }
}
