// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';
import 'package:duolingo4d/src/response/stories/story.dart';

export 'package:duolingo4d/src/response/stories/story.dart';
export 'package:duolingo4d/src/response/stories/story_mode.dart';
export 'package:duolingo4d/src/response/stories/story_state.dart';
export 'package:duolingo4d/src/response/stories/illustration.dart';

class StoriesResponse extends Response {
  /// Returns the new instance of [StoriesResponse] based on arguments.
  StoriesResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.stories,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The stories
  final List<Story> stories;

  @override
  String toString() => 'StoriesResponse(stories: $stories)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is StoriesResponse && listEquals(other.stories, stories);
  }

  @override
  int get hashCode => stories.hashCode;
}
