// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Character {
  /// Returns the new instance of [Character] based on arguments.
  Character.from({
    required this.value,
    required this.transliteration,
    required this.ttsUrl,
    required this.proficiency,
  });

  /// The value
  final String value;

  /// The transliteration
  final String transliteration;

  /// The TTS url
  final String ttsUrl;

  /// The proficiency
  final double proficiency;

  /// Returns true if this character is empty, otherwise false.
  bool get isEmpty => value.isEmpty;

  /// Returns true if this character is not empty, otherwise false.
  bool get isNotEmpty => !isEmpty;

  @override
  String toString() {
    return 'Character(value: $value, transliteration: $transliteration, ttsUrl: $ttsUrl, proficiency: $proficiency)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.value == value &&
        other.transliteration == transliteration &&
        other.ttsUrl == ttsUrl &&
        other.proficiency == proficiency;
  }

  @override
  int get hashCode {
    return value.hashCode ^
        transliteration.hashCode ^
        ttsUrl.hashCode ^
        proficiency.hashCode;
  }
}
