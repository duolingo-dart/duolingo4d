// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:duolingo4d/duolingo4d.dart';

import 'package:duolingo4d/src/response/user/skill_chapter.dart';

class SkillBook {
  /// Returns the new instance of [SkillBook] based on arguments.
  SkillBook.from({
    required this.chapters,
  });

  /// The chapters
  List<SkillChapter> chapters;

  @override
  String toString() => 'SkillBook(chapters: $chapters)';

  /// Returns all skills in this skill book.
  List<Skill> toFlat() {
    final skills = <Skill>[];
    for (final chapter in chapters) {
      for (final content in chapter.contents) {
        skills.add(content);
      }
    }

    return skills;
  }

  /// Returns true if this skill book is empty, otherwise false.
  bool get isEmpty => chapters.isEmpty;

  /// Returns true if this skill book is not empty, otherwise false.
  bool get isNotEmpty => !isEmpty;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is SkillBook && listEquals(other.chapters, chapters);
  }

  @override
  int get hashCode => chapters.hashCode;
}
