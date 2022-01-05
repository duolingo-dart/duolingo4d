// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Follower {
  /// Returns the new instance of [Follower] based on arguments.
  Follower.from({
    required this.id,
    required this.name,
    required this.fullname,
    required this.pictureUrl,
    required this.weeklyXp,
    required this.monthlyXp,
    required this.totalXp,
    required this.hasPlus,
  });

  /// The id
  final String id;

  /// The usename
  final String name;

  /// The fullname
  final String fullname;

  /// The picture url
  final String pictureUrl;

  /// The weekly xp
  final int weeklyXp;

  /// The monthly xp
  final int monthlyXp;

  /// The total xp
  final int totalXp;

  /// The flag that user has plus status or not
  final bool hasPlus;

  @override
  String toString() {
    return 'Follower(id: $id, name: $name, fullname: $fullname, pictureUrl: $pictureUrl, weeklyXp: $weeklyXp, monthlyXp: $monthlyXp, totalXp: $totalXp, hasPlus: $hasPlus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Follower &&
        other.id == id &&
        other.name == name &&
        other.fullname == fullname &&
        other.pictureUrl == pictureUrl &&
        other.weeklyXp == weeklyXp &&
        other.monthlyXp == monthlyXp &&
        other.totalXp == totalXp &&
        other.hasPlus == hasPlus;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        fullname.hashCode ^
        pictureUrl.hashCode ^
        weeklyXp.hashCode ^
        monthlyXp.hashCode ^
        totalXp.hashCode ^
        hasPlus.hashCode;
  }
}
