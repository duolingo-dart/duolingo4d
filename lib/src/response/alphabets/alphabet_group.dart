// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/src/response/alphabets/alphabets_response.dart';

class AlphabetGroup {
  /// Returns the new instance of [AlphabetGroup] based on arguments.
  AlphabetGroup.from({
    required this.name,
    required this.title,
    required this.subtitle,
    required this.characterBook,
  });

  /// The name
  final String name;

  /// The title
  final String title;

  /// The subtitle
  final String subtitle;

  /// The character book
  final CharacterBook characterBook;

  @override
  String toString() {
    return 'AlphabetGroup(name: $name, title: $title, subtitle: $subtitle, characterBook: $characterBook)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlphabetGroup &&
        other.name == name &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.characterBook == characterBook;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        characterBook.hashCode;
  }
}
