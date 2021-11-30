// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/entity/wordhint/hint_header.dart';
import 'package:duolingo4d/src/entity/wordhint/hint_row.dart';

class HintTable {
  /// Returns the new instance of [HintTable] based on arguments.
  HintTable.from({
    required this.hintHeaders,
    required this.hintRows,
    required this.references,
  });

  /// The hint headers
  final List<HintHeader> hintHeaders;

  /// The hint rows
  final List<HintRow> hintRows;

  /// The references
  final List<int> references;
}
