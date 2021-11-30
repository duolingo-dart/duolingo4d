// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Course {
  /// Returns the new instance of [Course] based on arguments.
  Course.from({
    required this.id,
    required this.title,
    required this.authorId,
    required this.fromLanguage,
    required this.learningLanguage,
    required this.preload,
    required this.placementTestAvailable,
    required this.xp,
    required this.crowns,
    required this.healthEnabled,
  });

  /// The id
  final String id;

  /// The title
  final String title;

  /// The author id
  final String authorId;

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  /// The preload flag
  final bool preload;

  /// The flag that represents placement test is available or not
  final bool placementTestAvailable;

  /// The XP
  final int xp;

  /// The crowns
  final int crowns;

  /// The flag that represents health is enabled or not
  final bool healthEnabled;
}
