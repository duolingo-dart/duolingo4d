// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/alphabets/character.dart';

class CharacterChapter {
  /// Returns the new instance of [CharacterChapter] based on an argument.
  CharacterChapter.from({
    required this.contents,
  });

  /// The characters
  final List<Character> contents;

  @override
  String toString() => 'CharacterChapter(contents: $contents)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is CharacterChapter && listEquals(other.contents, contents);
  }

  @override
  int get hashCode => contents.hashCode;
}
