// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/overview/vocabulary.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

export 'package:duolingo4d/src/response/overview/vocabulary.dart';

/// This class represents the Overview API response entity in the Duolingo API.
///
/// Based on the learning-in-progress data of the authenticated user,
/// the language code being learned will be set to [learningLanguage]
/// and the language code being used for learning will be set to [fromLanguage].
///
/// The learned word data in the user's currently selected language will be set to [vocabularies].
///
/// **_Example:_**
///
///```dart
///void main() async {
///  final duolingo = Duolingo.instance;
///
///  final authResponse = await duolingo.authenticate(
///    username: 'test_username',
///    password: 'test_password',
///  );
///
///  final overviewResponse = await duolingo.overview();
///
///  for (final vocabulary in overviewResponse.vocabularies) {
///      print(vocabulary.word);
///  }
///}
///```
class OverviewResponse extends Response {
  /// Returns the new instance of [OverviewResponse] based on arguments.
  OverviewResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.languageString,
    required this.fromLanguage,
    required this.learningLanguage,
    required this.vocabularies,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The language string
  final String languageString;

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  /// The vocabularies
  final List<Vocabulary> vocabularies;

  @override
  String toString() {
    return 'OverviewResponse(languageString: $languageString, fromLanguage: $fromLanguage, learningLanguage: $learningLanguage, vocabularies: $vocabularies)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is OverviewResponse &&
        other.languageString == languageString &&
        other.fromLanguage == fromLanguage &&
        other.learningLanguage == learningLanguage &&
        listEquals(other.vocabularies, vocabularies);
  }

  @override
  int get hashCode {
    return languageString.hashCode ^
        fromLanguage.hashCode ^
        learningLanguage.hashCode ^
        vocabularies.hashCode;
  }
}
