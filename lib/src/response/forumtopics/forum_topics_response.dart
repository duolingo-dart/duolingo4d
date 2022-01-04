// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/forumtopics/forum_topic.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

class ForumTopicsResponse extends Response {
  /// Returns the new instance of [ForumTopicsResponse] based on arguments.
  ForumTopicsResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.forumTopics,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The forum topics
  final List<ForumTopic> forumTopics;

  @override
  String toString() => 'ForumTopicsResponse(forumTopics: $forumTopics)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ForumTopicsResponse &&
        listEquals(other.forumTopics, forumTopics);
  }

  @override
  int get hashCode => forumTopics.hashCode;
}
