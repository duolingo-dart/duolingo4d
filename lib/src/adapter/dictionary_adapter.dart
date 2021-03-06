// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/dictionary/dictionary_response.dart';

class DictionaryAdapter extends Adapter<DictionaryResponse> {
  /// Returns the new instance of [DictionaryAdapter].
  DictionaryAdapter.newInstance();

  @override
  DictionaryResponse convert({
    required Response response,
  }) =>
      _buildDictionaryResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  DictionaryResponse _buildDictionaryResponse({
    required Response response,
    required Json json,
  }) =>
      DictionaryResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        id: json.getString(key: 'lexeme_id'),
        word: json.getString(key: 'word'),
        imageUrl: json.getString(key: 'lexeme_image'),
        fromLanguage: json.getString(key: 'from_language'),
        learningLanguage: json.getString(key: 'learning_language'),
        fromLanguageName: json.getString(key: 'from_language_name'),
        learningLanguageName: json.getString(key: 'learning_language_name'),
        pos: json.getString(key: 'pos'),
        infinitive: json.getString(key: 'infinitive'),
        translations: json.getString(key: 'translations'),
        ttsUrl: json.getString(key: 'tts'),
        canonicalUrl: json.getString(key: 'canonical_path'),
        alternativeForms: _buildAlternativeForms(
          jsonArray: json.getArray(key: 'alternative_forms'),
        ),
        relatedLexemes: _buildLexemes(
          jsonArray: json.getArray(key: 'related_lexemes'),
        ),
        relatedDiscussions: _buildDiscussions(
          jsonArray: json.getArray(key: 'related_discussions'),
        ),
        isGeneric: json.getBool(key: 'is_generic'),
        hasTts: json.getBool(key: 'has_tts'),
      );

  List<AlternativeForm> _buildAlternativeForms({
    required JsonArray jsonArray,
  }) {
    final alternativeForms = <AlternativeForm>[];
    jsonArray.forEach((json) {
      alternativeForms.add(
        AlternativeForm.from(
          word: json.getString(key: 'word'),
          numeral: json.getString(key: 'number'),
          gender: json.getString(key: 'gender'),
          text: json.getString(key: 'text'),
          translationText: json.getString(key: 'translation_text'),
          translation: json.getString(key: 'translation'),
          exampleSentence: json.getString(key: 'example_sentence'),
          link: json.getString(key: 'link'),
          ttsUrl: json.getString(key: 'tts'),
          discussion: _buildDiscussion(
            json: json.get(key: 'discussion'),
          ),
          isMatched: json.getBool(key: 'word_value_matched'),
          isInvalid: json.getBool(key: 'invalid'),
          isHighlighted: json.getBool(key: 'highlighted'),
        ),
      );
    });

    return alternativeForms;
  }

  List<Lexeme> _buildLexemes({
    required JsonArray jsonArray,
  }) {
    final lexemes = <Lexeme>[];
    jsonArray.forEach((json) {
      lexemes.add(
        Lexeme.from(
          url: json.getString(key: 'url'),
          abchor: json.getString(
            key: 'anchor',
          ),
        ),
      );
    });

    return lexemes;
  }

  List<Discussion> _buildDiscussions({
    required JsonArray jsonArray,
  }) {
    final discussions = <Discussion>[];
    jsonArray.forEach((json) {
      discussions.add(
        _buildDiscussion(json: json),
      );
    });

    return discussions;
  }

  Discussion _buildDiscussion({
    required Json json,
  }) =>
      Discussion.from(
        url: json.getString(key: 'url'),
        numComments: json.getString(key: 'num_comments'),
        anchor: json.getString(key: 'anchor'),
      );
}
