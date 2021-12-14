// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart';

import 'package:duolingo4d/duolingo4d.dart';
import 'package:duolingo4d/src/response/dictionary/alternative_form.dart';
import 'package:duolingo4d/src/response/dictionary/discussion.dart';
import 'package:duolingo4d/src/response/dictionary/lexeme.dart';

class DictionaryResponse extends Response {
  /// Returns the new instance of [DictionaryResponse] based on arguments.
  DictionaryResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.id,
    required this.value,
    required this.imageUrl,
    required this.fromLanguage,
    required this.learningLanguage,
    required this.fromLanguageName,
    required this.learningLanguageName,
    required this.pos,
    required this.infinitive,
    required this.translations,
    required this.ttsUrl,
    required this.canonicalUrl,
    required this.alternativeForms,
    required this.relatedLexemes,
    required this.relatedDiscussions,
    required this.isGeneric,
    required this.hasTts,
  }) : super.from(
          status: Status.from(code: statusCode, reasonPhrase: reasonPhrase),
          headers: headers,
        );

  /// The id
  final String id;

  /// The value
  final String value;

  /// The image url
  final String imageUrl;

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  /// The name of from language
  final String fromLanguageName;

  /// The name of learning language
  final String learningLanguageName;

  /// The pos
  final String pos;

  /// The infinitive
  final String infinitive;

  /// The translations
  final String translations;

  /// The url of TTS
  final String ttsUrl;

  /// The canonical url of this dictionary
  final String canonicalUrl;

  /// The alternative forms
  final List<AlternativeForm> alternativeForms;

  /// The related lexemes
  final List<Lexeme> relatedLexemes;

  /// The related discussions
  final List<Discussion> relatedDiscussions;

  /// The flag that represents this is generic or not
  final bool isGeneric;

  /// The flag that represents it has TTS or not
  final bool hasTts;

  @override
  String toString() {
    return 'DictionaryResponse(id: $id, value: $value, imageUrl: $imageUrl, fromLanguage: $fromLanguage, learningLanguage: $learningLanguage, fromLanguageName: $fromLanguageName, learningLanguageName: $learningLanguageName, pos: $pos, infinitive: $infinitive, translations: $translations, ttsUrl: $ttsUrl, canonicalUrl: $canonicalUrl, alternativeForms: $alternativeForms, relatedLexemes: $relatedLexemes, relatedDiscussions: $relatedDiscussions, isGeneric: $isGeneric, hasTts: $hasTts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is DictionaryResponse &&
        other.id == id &&
        other.value == value &&
        other.imageUrl == imageUrl &&
        other.fromLanguage == fromLanguage &&
        other.learningLanguage == learningLanguage &&
        other.fromLanguageName == fromLanguageName &&
        other.learningLanguageName == learningLanguageName &&
        other.pos == pos &&
        other.infinitive == infinitive &&
        other.translations == translations &&
        other.ttsUrl == ttsUrl &&
        other.canonicalUrl == canonicalUrl &&
        listEquals(other.alternativeForms, alternativeForms) &&
        listEquals(other.relatedLexemes, relatedLexemes) &&
        listEquals(other.relatedDiscussions, relatedDiscussions) &&
        other.isGeneric == isGeneric &&
        other.hasTts == hasTts;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        value.hashCode ^
        imageUrl.hashCode ^
        fromLanguage.hashCode ^
        learningLanguage.hashCode ^
        fromLanguageName.hashCode ^
        learningLanguageName.hashCode ^
        pos.hashCode ^
        infinitive.hashCode ^
        translations.hashCode ^
        ttsUrl.hashCode ^
        canonicalUrl.hashCode ^
        alternativeForms.hashCode ^
        relatedLexemes.hashCode ^
        relatedDiscussions.hashCode ^
        isGeneric.hashCode ^
        hasTts.hashCode;
  }
}
