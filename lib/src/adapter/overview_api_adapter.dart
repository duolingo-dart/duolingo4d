// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/json.dart';
import 'package:duolingo4d/src/response/overview/overview_response.dart';
import 'package:duolingo4d/src/response/overview/vocabulary.dart';

class OverviewApiAdapter extends Adapter<OverviewResponse> {
  @override
  OverviewResponse execute({
    required Response response,
  }) =>
      _buildOverviewEntity(
        response: response,
        json: Json.fromJsonString(value: response.body),
      );

  OverviewResponse _buildOverviewEntity({
    required Response response,
    required Json json,
  }) =>
      OverviewResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        fromLanguage: json.getStringValue(key: 'from_language'),
        learningLanguage: json.getStringValue(key: 'learning_language'),
        vocabularies: _buildVocabularies(
          jsonList: json.getJsonList(key: 'vocab_overview'),
        ),
      );

  List<Vocabulary> _buildVocabularies({
    required List<Json> jsonList,
  }) {
    final vocabularies = <Vocabulary>[];

    for (final json in jsonList) {
      vocabularies.add(
        Vocabulary.from(
          id: json.getStringValue(key: 'id'),
          word: json.getStringValue(key: 'word_string'),
          normalizedWord: json.getStringValue(key: 'normalized_string'),
          strengthBars: json.getIntValue(key: 'strength_bars'),
          proficiency: json.getDoubleValue(key: 'strength'),
          infinitive: json.getStringValue(key: 'infinitive'),
          skill: json.getStringValue(key: 'skill'),
          skillUrlTitle: json.getStringValue(key: 'skill_url_title'),
          pos: json.getStringValue(key: 'pos'),
          gender: json.getStringValue(key: 'gender'),
          lexemeId: json.getStringValue(key: 'lexeme_id'),
          relatedLexemes: json.getStringValues(key: 'related_lexemes'),
          lastPracticed: json.getStringValue(key: 'last_practiced'),
          lastPracticedMs: json.getIntValue(key: 'last_practiced_ms'),
        ),
      );
    }

    return vocabularies;
  }
}
