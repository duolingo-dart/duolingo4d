// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/entity/hint/hint_cell.dart';
import 'package:duolingo4d/src/entity/hint/hint_header.dart';
import 'package:duolingo4d/src/entity/hint/hint_row.dart';
import 'package:duolingo4d/src/entity/hint/hint_table.dart';
import 'package:duolingo4d/src/entity/hint/hint_token.dart';
import 'package:duolingo4d/src/entity/hint/word_hint_entity.dart';
import 'package:duolingo4d/src/json.dart';

class WordHintApiAdapter extends Adapter<WordHintEntity> {
  @override
  WordHintEntity execute({
    required Response response,
  }) =>
      _buildWordHintEntity(
        response: response,
        json: Json.fromJsonString(value: response.body),
      );

  WordHintEntity _buildWordHintEntity({
    required Response response,
    required Json json,
  }) =>
      WordHintEntity.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        hintTokens: _buildHintTokens(
          jsonList: json.getJsonList(key: 'tokens'),
        ),
      );

  List<HintToken> _buildHintTokens({
    required List<Json> jsonList,
  }) {
    final hintTokens = <HintToken>[];

    for (final json in jsonList) {
      final value = json.getStringValue(key: 'value');

      if (value.trim().isEmpty) {
        continue;
      }

      hintTokens.add(
        HintToken.from(
          index: json.getIntValue(key: 'index'),
          value: value,
          hintTable: _buildHintTable(
            json: json.getJson(key: 'hint_table'),
          ),
        ),
      );
    }

    return hintTokens;
  }

  HintTable _buildHintTable({
    required Json json,
  }) =>
      HintTable.from(
        hintHeaders: _buildHintHeaders(
          jsonList: json.getJsonList(key: 'headers'),
        ),
        hintRows: _buildHintRows(
          jsonList: json.getJsonList(key: 'rows'),
        ),
        references: json.getIntValues(key: 'references'),
      );

  List<HintHeader> _buildHintHeaders({
    required List<Json> jsonList,
  }) {
    final hintHeaders = <HintHeader>[];

    for (final json in jsonList) {
      hintHeaders.add(
        HintHeader.from(
          token: json.getStringValue(key: 'token'),
          selected: json.getBoolValue(key: 'selected'),
        ),
      );
    }

    return hintHeaders;
  }

  List<HintRow> _buildHintRows({
    required List<Json> jsonList,
  }) {
    final hintRows = <HintRow>[];

    for (final json in jsonList) {
      hintRows.add(
        HintRow.from(
          hintCells: _buildHintCells(
            jsonList: json.getJsonList(key: 'cells'),
          ),
        ),
      );
    }

    return hintRows;
  }

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
          hint: json.getStringValue(key: 'hint'),
          span: json.getIntValue(key: 'colspan'),
        ),
      );
    }

    return hintCells;
  }
}
