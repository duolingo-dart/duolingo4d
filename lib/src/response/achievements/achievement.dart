// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

class Achievement {
  ///Returns the new instance of [Achievement] based on arguments.
  Achievement.from({
    required this.name,
    required this.point,
    required this.level,
    required this.levelThresholds,
  });

  /// The name
  final String name;

  /// The point
  final int point;

  /// The level
  final int level;

  /// The thresholds of level
  final List<int> levelThresholds;

  @override
  String toString() {
    return 'Achievement(name: $name, point: $point, level: $level, levelThresholds: $levelThresholds)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Achievement &&
        other.name == name &&
        other.point == point &&
        other.level == level &&
        listEquals(other.levelThresholds, levelThresholds);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        point.hashCode ^
        level.hashCode ^
        levelThresholds.hashCode;
  }
}
