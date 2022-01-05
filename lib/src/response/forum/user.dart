// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class User {
  /// Returns the new instance of [User] based on arguments.
  User.from({
    required this.id,
    required this.name,
    required this.fullname,
    required this.avatarUrl,
    required this.isAdmin,
  });

  /// The id
  final String id;

  /// The name
  final String name;

  /// The fullname
  final String fullname;

  /// The avatar url
  final String avatarUrl;

  /// The flag that represents this user is admin or not
  final bool isAdmin;

  @override
  String toString() {
    return 'User(id: $id, name: $name, fullname: $fullname, avatarUrl: $avatarUrl, isAdmin: $isAdmin)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.fullname == fullname &&
        other.avatarUrl == avatarUrl &&
        other.isAdmin == isAdmin;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        fullname.hashCode ^
        avatarUrl.hashCode ^
        isAdmin.hashCode;
  }
}
