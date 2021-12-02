// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

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
}
