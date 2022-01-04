// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Subtopic {
  /// Returns the new instansce of [Subtopic] based on arguments.
  Subtopic.from({
    required this.id,
    required this.name,
    required this.displayName,
    required this.fromLanguage,
    required this.learningLanguage,
  });

  /// The id
  final int id;

  /// The name
  final String name;

  /// The display name
  final String displayName;

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  @override
  String toString() {
    return 'Subtopic(id: $id, name: $name, displayName: $displayName, fromLanguage: $fromLanguage, learningLanguage: $learningLanguage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Subtopic &&
        other.id == id &&
        other.name == name &&
        other.displayName == displayName &&
        other.fromLanguage == fromLanguage &&
        other.learningLanguage == learningLanguage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        displayName.hashCode ^
        fromLanguage.hashCode ^
        learningLanguage.hashCode;
  }
}
