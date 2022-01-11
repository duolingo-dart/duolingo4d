// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/searchfriend/searched_user.dart';
import 'package:duolingo4d/src/response/status.dart';

export 'package:duolingo4d/src/response/searchfriend/searched_user.dart';

class SearchFriendResponse extends Response {
  /// Returns the new instance of [SearchFriendResponse] based on arguments.
  SearchFriendResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.page,
    required this.numberOfResults,
    required this.hasMore,
    required this.users,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The page
  final int page;

  /// The number of results
  final int numberOfResults;

  /// The flag that represents this search result has more pages.
  final bool hasMore;

  /// The serahced user
  final List<SearchedUser> users;

  @override
  String toString() {
    return 'SearchFriendResponse(page: $page, numberOfResults: $numberOfResults, hasMore: $hasMore, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is SearchFriendResponse &&
        other.page == page &&
        other.numberOfResults == numberOfResults &&
        other.hasMore == hasMore &&
        listEquals(other.users, users);
  }

  @override
  int get hashCode {
    return page.hashCode ^
        numberOfResults.hashCode ^
        hasMore.hashCode ^
        users.hashCode;
  }
}
