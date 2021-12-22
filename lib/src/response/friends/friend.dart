// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Friend {
  /// Returns the new instance of [Friend] based on arguments.
  Friend.from({
    required this.id,
    required this.username,
    required this.name,
    required this.pictureUrl,
    required this.weeklyXp,
    required this.monthlyXp,
    required this.totalXp,
    required this.hasPlus,
  });

  /// The id
  final String id;

  /// The usename
  final String username;

  /// The name
  final String name;

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
    return 'Friend(id: $id, username: $username, name: $name, pictureUrl: $pictureUrl, weeklyXp: $weeklyXp, monthlyXp: $monthlyXp, totalXp: $totalXp, hasPlus: $hasPlus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Friend &&
        other.id == id &&
        other.username == username &&
        other.name == name &&
        other.pictureUrl == pictureUrl &&
        other.weeklyXp == weeklyXp &&
        other.monthlyXp == monthlyXp &&
        other.totalXp == totalXp &&
        other.hasPlus == hasPlus;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        name.hashCode ^
        pictureUrl.hashCode ^
        weeklyXp.hashCode ^
        monthlyXp.hashCode ^
        totalXp.hashCode ^
        hasPlus.hashCode;
  }
}
