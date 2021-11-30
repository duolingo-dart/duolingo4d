// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

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
}
