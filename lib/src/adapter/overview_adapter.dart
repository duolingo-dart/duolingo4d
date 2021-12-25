// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/overview/overview_response.dart';

/// This class provides the function to convert the response
/// returned from the overview API into the [OverviewResponse] format.
class OverviewAdapter extends Adapter<OverviewResponse> {
  /// Returns the new instance of [OverviewAdapter].
  OverviewAdapter.newInstance();

  @override
  OverviewResponse convert({
    required Response response,
  }) =>
      _buildOverviewResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  /// Returns [OverviewResponse] based on [response] and [json].
  OverviewResponse _buildOverviewResponse({
    required Response response,
    required JsonResponse json,
  }) =>
      OverviewResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        languageString: json.getString(key: 'language_string'),
        fromLanguage: json.getString(key: 'from_language'),
        learningLanguage: json.getString(key: 'learning_language'),
        vocabularies: _buildVocabularies(
          jsonList: json.getJsonList(key: 'vocab_overview'),
        ),
      );

  /// Returns [Vocabulary] list based on [jsonList].
  List<Vocabulary> _buildVocabularies({
    required List<JsonResponse> jsonList,
  }) {
    final vocabularies = <Vocabulary>[];

    for (final json in jsonList) {
      vocabularies.add(
        Vocabulary.from(
          id: json.getString(key: 'id'),
          word: json.getString(key: 'word_string'),
          normalizedWord: json.getString(key: 'normalized_string'),
          strengthBars: json.getInt(key: 'strength_bars'),
          proficiency: json.getDouble(key: 'strength'),
          infinitive: json.getString(key: 'infinitive'),
          skill: json.getString(key: 'skill'),
          skillUrlTitle: json.getString(key: 'skill_url_title'),
          pos: json.getString(key: 'pos'),
          gender: json.getString(key: 'gender'),
          lexemeId: json.getString(key: 'lexeme_id'),
          relatedLexemes: json.getStringValues(key: 'related_lexemes'),
          lastPracticed: json.getString(key: 'last_practiced'),
          lastPracticedMs: json.getInt(key: 'last_practiced_ms'),
        ),
      );
    }

    return vocabularies;
  }
}
