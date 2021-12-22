// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart';

import 'package:duolingo4d/src/response/friends/friend.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

export 'package:duolingo4d/src/response/friends/friend.dart';

class FriendsResponse extends Response {
  /// Returns the new instance of [FriendsResponse] based on arguments.
  FriendsResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.friends,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The friends
  final List<Friend> friends;

  @override
  String toString() => 'FriendsResponse(friends: $friends)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is FriendsResponse && listEquals(other.friends, friends);
  }

  @override
  int get hashCode => friends.hashCode;
}
