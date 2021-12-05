// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents the course information that the user has learned.
class Course {
  /// Returns the new instance of [Course] based on arguments.
  Course.from({
    required this.id,
    required this.title,
    required this.fromLanguage,
    required this.learningLanguage,
    required this.xp,
    required this.crowns,
  });

  /// The id
  final String id;

  /// The title
  final String title;

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  /// The XP
  final int xp;

  /// The crowns
  final int crowns;

  @override
  String toString() {
    return 'Course(id: $id, title: $title, fromLanguage: $fromLanguage, learningLanguage: $learningLanguage, xp: $xp, crowns: $crowns)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Course &&
        other.id == id &&
        other.title == title &&
        other.fromLanguage == fromLanguage &&
        other.learningLanguage == learningLanguage &&
        other.xp == xp &&
        other.crowns == crowns;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        fromLanguage.hashCode ^
        learningLanguage.hashCode ^
        xp.hashCode ^
        crowns.hashCode;
  }
}
