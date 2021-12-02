// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents the metadata used to parse the token.
///
/// This header contains split word information other than this token.
/// The [token] is set to the word that has been broken down to the smallest unit,
/// and the [selected] flag can be used to check which word is
/// currently being parsed for this token unit.
class HintHeader {
  /// Returns the new instance of [HintHeader] based on arguments.
  HintHeader.from({
    required this.token,
    required this.selected,
  });

  /// The token
  final String token;

  /// The flag that represents the axis of the token
  final bool selected;
}
