// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class ForumTopic {
  /// Returns the new instance of [ForumTopic] based on arguments.
  ForumTopic.from({
    required this.id,
    required this.name,
    required this.displayName,
    required this.fromLanguage,
    required this.learningLanguage,
    required this.fromLanguageName,
    required this.learningLanguageName,
    required this.isSubscribed,
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

  /// The name of from language
  final String fromLanguageName;

  /// The name of learning language
  final String learningLanguageName;

  /// The flag that represents this topic is subscribed or not
  final bool isSubscribed;

  @override
  String toString() {
    return 'ForumTopic(id: $id, name: $name, displayName: $displayName, fromLanguage: $fromLanguage, learningLanguage: $learningLanguage, fromLanguageName: $fromLanguageName, learningLanguageName: $learningLanguageName, isSubscribed: $isSubscribed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ForumTopic &&
        other.id == id &&
        other.name == name &&
        other.displayName == displayName &&
        other.fromLanguage == fromLanguage &&
        other.learningLanguage == learningLanguage &&
        other.fromLanguageName == fromLanguageName &&
        other.learningLanguageName == learningLanguageName &&
        other.isSubscribed == isSubscribed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        displayName.hashCode ^
        fromLanguage.hashCode ^
        learningLanguage.hashCode ^
        fromLanguageName.hashCode ^
        learningLanguageName.hashCode ^
        isSubscribed.hashCode;
  }
}
