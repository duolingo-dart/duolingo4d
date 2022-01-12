// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/searchforum/searched_forum.dart';
import 'package:duolingo4d/src/response/status.dart';

export 'package:duolingo4d/src/response/searchforum/searched_forum.dart';

class SearchForumResponse extends Response {
  /// Returns the new instance of [SearchForumResponse] based on arguments.
  SearchForumResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.forums,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The searched forums
  final List<SearchedForum> forums;

  @override
  String toString() => 'SearchForumResponse(forums: $forums)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is SearchForumResponse && listEquals(other.forums, forums);
  }

  @override
  int get hashCode => forums.hashCode;
}
