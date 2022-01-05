// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';
import 'package:duolingo4d/src/response/subscriptions/following_user.dart';

export 'package:duolingo4d/src/response/subscriptions/following_user.dart';

class SubscriptionsResponse extends Response {
  /// Returns the new instance of [SubscriptionsResponse] based on arguments.
  SubscriptionsResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.followingUsers,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The following users
  final List<FollowingUser> followingUsers;

  @override
  String toString() => 'SubscriptionsResponse(followingUsers: $followingUsers)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is SubscriptionsResponse &&
        listEquals(other.followingUsers, followingUsers);
  }

  @override
  int get hashCode => followingUsers.hashCode;
}
