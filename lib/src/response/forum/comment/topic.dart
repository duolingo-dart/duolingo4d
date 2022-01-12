// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Topic {
  /// Returns the new instance of [Topic] based on arguments.
  Topic.from({
    required this.id,
    required this.name,
    required this.fromLanguage,
    required this.learningLanguage,
  });

  /// The id
  final int id;

  /// The name
  final String name;

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  @override
  String toString() {
    return 'Topic(id: $id, name: $name, fromLanguage: $fromLanguage, learningLanguage: $learningLanguage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Topic &&
        other.id == id &&
        other.name == name &&
        other.fromLanguage == fromLanguage &&
        other.learningLanguage == learningLanguage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        fromLanguage.hashCode ^
        learningLanguage.hashCode;
  }
}
