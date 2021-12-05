// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents a configuration related to gems during learning.
class GemsConfiguration {
  /// Returns the new instance of [GemsConfiguration] based on arguments.
  GemsConfiguration.from({
    required this.gems,
    required this.gemsPerSkill,
    required this.useGems,
  });

  /// The gems
  final int gems;

  /// The gemes per skill
  final int gemsPerSkill;

  /// The flag that represents use gems or not
  final bool useGems;

  @override
  String toString() =>
      'GemsConfiguration(gems: $gems, gemsPerSkill: $gemsPerSkill, useGems: $useGems)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GemsConfiguration &&
        other.gems == gems &&
        other.gemsPerSkill == gemsPerSkill &&
        other.useGems == useGems;
  }

  @override
  int get hashCode => gems.hashCode ^ gemsPerSkill.hashCode ^ useGems.hashCode;
}
