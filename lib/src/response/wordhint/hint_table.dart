// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:collection/collection.dart';

import 'package:duolingo4d/src/response/wordhint/hint_header.dart';
import 'package:duolingo4d/src/response/wordhint/hint_row.dart';

/// This class represents a table that manages the header information
/// and rows or cells for each hint token.
///
/// The [headers] section contains metadata for the token analysis.
/// The [rows] section contains cell information where token hint information is set.
/// The [references] contains a reference index to the word or sentence
/// before it was split, excluding this token.
class HintTable {
  /// Returns the new instance of [HintTable] based on arguments.
  HintTable.from({
    required this.headers,
    required this.rows,
    required this.references,
  });

  /// The hint headers
  final List<HintHeader> headers;

  /// The hint rows
  final List<HintRow> rows;

  /// The references
  final List<int> references;

  @override
  String toString() =>
      'HintTable(headers: $headers, rows: $rows, references: $references)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is HintTable &&
        listEquals(other.headers, headers) &&
        listEquals(other.rows, rows) &&
        listEquals(other.references, references);
  }

  @override
  int get hashCode => headers.hashCode ^ rows.hashCode ^ references.hashCode;
}
