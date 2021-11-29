// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class HintCell {
  /// Returns the new instance of [HintCell] based on arguments.
  HintCell.from({
    required this.hint,
    required this.span,
  });

  /// The hint
  final String hint;

  /// The span
  final int span;
}
