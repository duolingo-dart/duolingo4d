// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

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
}
