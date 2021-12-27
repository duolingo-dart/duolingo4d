// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/alphabets/character.dart';

class AlphabetGroup {
  /// Returns the new instance of [AlphabetGroup] based on arguments.
  AlphabetGroup.from({
    required this.name,
    required this.title,
    required this.subtitle,
    required this.characters,
  });

  /// The name
  final String name;

  /// The title
  final String title;

  /// The subtitle
  final String subtitle;

  /// The characters
  final List<Character> characters;

  @override
  String toString() {
    return 'AlphabetGroup(name: $name, title: $title, subtitle: $subtitle, characters: $characters)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is AlphabetGroup &&
        other.name == name &&
        other.title == title &&
        other.subtitle == subtitle &&
        listEquals(other.characters, characters);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        characters.hashCode;
  }
}
