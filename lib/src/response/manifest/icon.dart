// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Icon {
  /// Returns the new instance of [Icon] based on arguments.
  Icon.from({
    required this.src,
    required this.type,
    required this.sizes,
  });

  /// The src
  final String src;

  /// The type
  final String type;

  /// The sizes in "width * height" format
  final String sizes;

  @override
  String toString() => 'Icon(src: $src, type: $type, sizes: $sizes)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Icon &&
        other.src == src &&
        other.type == type &&
        other.sizes == sizes;
  }

  @override
  int get hashCode => src.hashCode ^ type.hashCode ^ sizes.hashCode;
}
