// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart';

import 'package:duolingo4d/src/response/user/skill.dart';

class SkillChapter {
  /// Returns the new instance of [SkillChapter] based on arguments.
  SkillChapter.from({
    required this.contents,
  });

  /// The skills
  final List<Skill> contents;

  @override
  String toString() => 'SkillChapter(contents: $contents)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is SkillChapter && listEquals(other.contents, contents);
  }

  @override
  int get hashCode => contents.hashCode;
}
