// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents a cell that manages the token's hint information.
///
/// The hint information associated with the token is set in [hint].
/// The index in [span] indicates where the hint information was
/// derived from in the analysis of the token.
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

  @override
  String toString() => 'HintCell(hint: $hint, span: $span)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HintCell && other.hint == hint && other.span == span;
  }

  @override
  int get hashCode => hint.hashCode ^ span.hashCode;
}
