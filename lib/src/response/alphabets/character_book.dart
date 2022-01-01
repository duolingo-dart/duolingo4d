// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:duolingo4d/src/response/alphabets/character.dart';

import 'package:duolingo4d/src/response/alphabets/character_chapter.dart';

class CharacterBook {
  /// Returns the new instance of [CharacterBook] based on an argument.
  CharacterBook.from({
    required this.chapters,
  });

  /// The character chapters
  final List<CharacterChapter> chapters;

  /// Returns all characters in this character book.
  List<Character> flatten() {
    final characters = <Character>[];
    for (final chapter in chapters) {
      for (final content in chapter.contents) {
        characters.add(content);
      }
    }

    return characters;
  }

  /// Returns true if this character book is empty, otherwise false.
  bool get isEmpty => chapters.isEmpty;

  /// Returns true if this character book is not empty, otherwise false.
  bool get isNotEmpty => !isEmpty;

  @override
  String toString() => 'CharacterBook(chapters: $chapters)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is CharacterBook && listEquals(other.chapters, chapters);
  }

  @override
  int get hashCode => chapters.hashCode;
}
