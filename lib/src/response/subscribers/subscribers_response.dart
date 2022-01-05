// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';
import 'package:duolingo4d/src/response/subscribers/follower.dart';

export 'package:duolingo4d/src/response/subscribers/follower.dart';

class SubscribersResponse extends Response {
  /// Returns the new instance of [SubscribersResponse] based on arguments.
  SubscribersResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.followers,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The followers
  final List<Follower> followers;

  @override
  String toString() => 'SubscribersResponse(followers: $followers)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is SubscribersResponse &&
        listEquals(other.followers, followers);
  }

  @override
  int get hashCode => followers.hashCode;
}
