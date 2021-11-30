// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/wordhint/hint_table.dart';

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
}
