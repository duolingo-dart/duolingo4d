// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

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
