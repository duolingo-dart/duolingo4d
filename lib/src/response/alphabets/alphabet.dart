// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/alphabets/alphabet_group.dart';

class Alphabet {
  /// Returns the new instance of [Alphabet] based on arguments.
  Alphabet.from({
    required this.id,
    required this.name,
    required this.title,
    required this.subtitle,
    required this.alphabetGroups,
  });

  /// The id
  final String id;

  /// The name
  final String name;

  /// The title
  final String title;

  /// The subtitle
  final String subtitle;

  /// The alphabet groups
  final List<AlphabetGroup> alphabetGroups;

  @override
  String toString() {
    return 'Alphabet(id: $id, name: $name, title: $title, subtitle: $subtitle, alphabetGroups: $alphabetGroups)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Alphabet &&
        other.id == id &&
        other.name == name &&
        other.title == title &&
        other.subtitle == subtitle &&
        listEquals(other.alphabetGroups, alphabetGroups);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        alphabetGroups.hashCode;
  }
}
