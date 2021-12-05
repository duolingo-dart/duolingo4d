// Package imports:
import 'package:collection/collection.dart';

// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents a mapping between language and some voice data.
class MultiVoiceDirection {
  /// Returns the new instance of [MultiVoiceDirection] based on arguments.
  MultiVoiceDirection.from({
    required this.language,
    required this.voices,
  });

  /// The language
  final String language;

  /// The voices
  final List<String> voices;

  @override
  String toString() =>
      'MultiVoiceDirection(language: $language, voices: $voices)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is MultiVoiceDirection &&
        other.language == language &&
        listEquals(other.voices, voices);
  }

  @override
  int get hashCode => language.hashCode ^ voices.hashCode;
}
