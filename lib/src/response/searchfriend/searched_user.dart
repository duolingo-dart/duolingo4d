// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class SearchedUser {
  /// Returns the new instance of [SearchedUser] based on arguments.
  SearchedUser.from({
    required this.id,
    required this.name,
    required this.fullname,
    required this.learningLanguage,
    required this.avatarUrl,
  });

  /// The id
  final String id;

  /// The name
  final String name;

  /// The fullname
  final String fullname;

  /// The learning language
  final String learningLanguage;

  /// The avatar url
  final String avatarUrl;

  @override
  String toString() {
    return 'SearchedUser(id: $id, name: $name, fullname: $fullname, learningLanguage: $learningLanguage, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchedUser &&
        other.id == id &&
        other.name == name &&
        other.fullname == fullname &&
        other.learningLanguage == learningLanguage &&
        other.avatarUrl == avatarUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        fullname.hashCode ^
        learningLanguage.hashCode ^
        avatarUrl.hashCode;
  }
}
