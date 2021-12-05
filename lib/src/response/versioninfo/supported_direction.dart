// Package imports:
import 'package:collection/collection.dart';

// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents a mapping between the learning languages
/// and the from language supported by Duolingo.
class SupportedDirection {
  /// Returns the new instance of [SupportedDirection] based on arguments.
  SupportedDirection.from({
    required this.fromLanguage,
    required this.learningLanguages,
  });

  /// The from language
  final String fromLanguage;

  /// The learning languages linked to [fromLanguage].
  final List<String> learningLanguages;

  @override
  String toString() =>
      'SupportedDirection(fromLanguage: $fromLanguage, learningLanguages: $learningLanguages)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is SupportedDirection &&
        other.fromLanguage == fromLanguage &&
        listEquals(other.learningLanguages, learningLanguages);
  }

  @override
  int get hashCode => fromLanguage.hashCode ^ learningLanguages.hashCode;
}
