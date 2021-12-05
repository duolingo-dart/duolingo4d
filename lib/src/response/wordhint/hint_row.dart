// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/wordhint/hint_cell.dart';

/// This class represents a row that manages the cells that contain the token hint information.
class HintRow {
  /// Returns the new instance of [HintRow] based on arguments.
  HintRow.from({
    required this.cells,
  });

  /// The hint cells
  final List<HintCell> cells;

  @override
  String toString() => 'HintRow(cells: $cells)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is HintRow && listEquals(other.cells, cells);
  }

  @override
  int get hashCode => cells.hashCode;
}
