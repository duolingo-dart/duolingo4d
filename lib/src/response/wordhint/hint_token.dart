// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/wordhint/hint_table.dart';

/// This class represents a token that manages the smallest unit of
/// words that are meaningful as a language.
///
/// The [value] is set to the split word that will be managed by this token.
/// The [index] is the position of the [value] before the word or sentence was split.
///
/// Detailed hint information is contained in the [table].
/// This [table] contains the header information, which is the metadata for word analysis,
/// and the row and cell data where the hint information is set.
class HintToken {
  /// Returns the new instance of [HintToken] based on arguments.
  HintToken.from({
    required this.index,
    required this.value,
    required this.table,
  });

  /// The index
  final int index;

  /// The value
  final String value;

  /// The hint table
  final HintTable table;

  @override
  String toString() => 'HintToken(index: $index, value: $value, table: $table)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HintToken &&
        other.index == index &&
        other.value == value &&
        other.table == table;
  }

  @override
  int get hashCode => index.hashCode ^ value.hashCode ^ table.hashCode;
}
