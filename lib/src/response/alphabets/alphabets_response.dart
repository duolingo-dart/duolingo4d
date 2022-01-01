// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/alphabets/alphabet.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

export 'package:duolingo4d/src/response/alphabets/alphabet.dart';
export 'package:duolingo4d/src/response/alphabets/character_book.dart';
export 'package:duolingo4d/src/response/alphabets/character_chapter.dart';
export 'package:duolingo4d/src/response/alphabets/alphabet_group.dart';
export 'package:duolingo4d/src/response/alphabets/character.dart';

class AlphabetsResponse extends Response {
  /// Returns the new instance of [AlphabetsResponse] based on arguments.
  AlphabetsResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.alphabets,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The alphabets
  final List<Alphabet> alphabets;

  @override
  String toString() => 'AlphabetsResponse(alphabets: $alphabets)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is AlphabetsResponse && listEquals(other.alphabets, alphabets);
  }

  @override
  int get hashCode => alphabets.hashCode;
}
