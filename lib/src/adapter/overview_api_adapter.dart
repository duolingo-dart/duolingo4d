// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/adapter/json.dart';
import 'package:duolingo4d/src/response/overview/overview_response.dart';

/// This class provides the function to convert the response
/// returned from the overview API into the [OverviewResponse] format.
class OverviewApiAdapter extends Adapter<OverviewResponse> {
  /// Returns the new instance of [OverviewApiAdapter].
  OverviewApiAdapter.newInstance();

  @override
  OverviewResponse convert({
    required Response response,
  }) =>
      _buildOverviewResponse(
        response: response,
        json: Json.fromJsonString(value: response.body),
      );

  /// Returns [OverviewResponse] based on [response] and [json].
  OverviewResponse _buildOverviewResponse({
    required Response response,
    required Json json,
  }) =>
      OverviewResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        languageString: json.getStringValue(key: 'language_string'),
        fromLanguage: json.getStringValue(key: 'from_language'),
        learningLanguage: json.getStringValue(key: 'learning_language'),
        vocabularies: _buildVocabularies(
          jsonList: json.getJsonList(key: 'vocab_overview'),
        ),
      );

  /// Returns [Vocabulary] list based on [jsonList].
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
