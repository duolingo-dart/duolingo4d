// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents a configuration related to XP during learning.
class XpConfiguration {
  /// Returns the new instance of [XpConfiguration] based on arguments.
  XpConfiguration.from({
    required this.maxSkillTestXp,
    required this.maxPlacementTestXp,
    required this.maxCheckpointTestXp,
  });

  /// The max placement test xp
  final int maxPlacementTestXp;

  /// The max skill test xp
  final int maxSkillTestXp;

  /// The max checkpoint test xp
  final int maxCheckpointTestXp;

  @override
  String toString() =>
      'XpConfiguration(maxPlacementTestXp: $maxPlacementTestXp, maxSkillTestXp: $maxSkillTestXp, maxCheckpointTestXp: $maxCheckpointTestXp)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is XpConfiguration &&
        other.maxPlacementTestXp == maxPlacementTestXp &&
        other.maxSkillTestXp == maxSkillTestXp &&
        other.maxCheckpointTestXp == maxCheckpointTestXp;
  }

  @override
  int get hashCode =>
      maxPlacementTestXp.hashCode ^
      maxSkillTestXp.hashCode ^
      maxCheckpointTestXp.hashCode;
}
