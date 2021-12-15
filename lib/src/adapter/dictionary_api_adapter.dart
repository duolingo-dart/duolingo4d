// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/adapter/json.dart';
import 'package:duolingo4d/src/response/dictionary/dictionary_response.dart';

class DictionaryApiAdapter extends Adapter<DictionaryResponse> {
  /// Returns the new instance of [DictionaryApiAdapter].
  DictionaryApiAdapter.newInstance();

  @override
  DictionaryResponse convert({
    required Response response,
  }) =>
      _buildDictionaryResponse(
        response: response,
        json: Json.fromBytes(bytes: response.bodyBytes),
      );

  DictionaryResponse _buildDictionaryResponse({
    required Response response,
    required Json json,
  }) =>
      DictionaryResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        id: json.getStringValue(key: 'lexeme_id'),
        word: json.getStringValue(key: 'word'),
        imageUrl: json.getStringValue(key: 'lexeme_image'),
        fromLanguage: json.getStringValue(key: 'from_language'),
        learningLanguage: json.getStringValue(key: 'learning_language'),
        fromLanguageName: json.getStringValue(key: 'from_language_name'),
        learningLanguageName:
            json.getStringValue(key: 'learning_language_name'),
        pos: json.getStringValue(key: 'pos'),
        infinitive: json.getStringValue(key: 'infinitive'),
        translations: json.getStringValue(key: 'translations'),
        ttsUrl: json.getStringValue(key: 'tts'),
        canonicalUrl: json.getStringValue(key: 'canonical_path'),
        alternativeForms: _buildAlternativeForms(
          jsonList: json.getJsonList(key: 'alternative_forms'),
        ),
        relatedLexemes: _buildLexemes(
          jsonList: json.getJsonList(key: 'related_lexemes'),
        ),
        relatedDiscussions: _buildDiscussions(
          jsonList: json.getJsonList(key: 'related_discussions'),
        ),
        isGeneric: json.getBoolValue(key: 'is_generic'),
        hasTts: json.getBoolValue(key: 'has_tts'),
      );

  List<AlternativeForm> _buildAlternativeForms({
    required List<Json> jsonList,
  }) {
    final alternativeForms = <AlternativeForm>[];
    for (final json in jsonList) {
      alternativeForms.add(
        AlternativeForm.from(
          word: json.getStringValue(key: 'word'),
          numeral: json.getStringValue(key: 'number'),
          gender: json.getStringValue(key: 'gender'),
          text: json.getStringValue(key: 'text'),
          translationText: json.getStringValue(key: 'translation_text'),
          translation: json.getStringValue(key: 'translation'),
          exampleSentence: json.getStringValue(key: 'example_sentence'),
          link: json.getStringValue(key: 'link'),
          ttsUrl: json.getStringValue(key: 'tts'),
          discussion: _buildDiscussion(
            json: json.getJson(key: 'discussion'),
          ),
          isMatched: json.getBoolValue(key: 'word_value_matched'),
          isInvalid: json.getBoolValue(key: 'invalid'),
          isHighlighted: json.getBoolValue(key: 'highlighted'),
        ),
      );
    }

    return alternativeForms;
  }

  List<Lexeme> _buildLexemes({
    required List<Json> jsonList,
  }) {
    final lexemes = <Lexeme>[];
    for (final json in jsonList) {
      lexemes.add(
        Lexeme.from(
          url: json.getStringValue(key: 'url'),
          abchor: json.getStringValue(
            key: 'anchor',
          ),
        ),
      );
    }

    return lexemes;
  }

  List<Discussion> _buildDiscussions({
    required List<Json> jsonList,
  }) {
    final discussions = <Discussion>[];
    for (final json in jsonList) {
      discussions.add(
        _buildDiscussion(json: json),
      );
    }

    return discussions;
  }

  Discussion _buildDiscussion({
    required Json json,
  }) =>
      Discussion.from(
        url: json.getStringValue(key: 'url'),
        numComments: json.getStringValue(key: 'num_comments'),
        anchor: json.getStringValue(key: 'anchor'),
      );
}
