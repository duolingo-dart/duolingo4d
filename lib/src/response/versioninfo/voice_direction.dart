// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents a mapping between language and voice data.
class VoiceDirection {
  /// Returns the new instance of [VoiceDirection] based on arguments.
  VoiceDirection.from({
    required this.language,
    required this.voice,
  });

  /// The language
  final String language;

  /// The voice
  final String voice;

  @override
  String toString() => 'VoiceDirection(language: $language, voice: $voice)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VoiceDirection &&
        other.language == language &&
        other.voice == voice;
  }

  @override
  int get hashCode => language.hashCode ^ voice.hashCode;
}
