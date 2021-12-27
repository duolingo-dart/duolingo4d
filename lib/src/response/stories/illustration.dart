// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/stories/story_state.dart';

class Illustration {
  /// Returns the new instance of [Illustration] based on arguments.
  Illustration.from({
    required this.state,
    required this.url,
  });

  /// The state
  final StoryState state;

  /// The url
  final String url;

  @override
  String toString() => 'Illustration(state: $state, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Illustration && other.state == state && other.url == url;
  }

  @override
  int get hashCode => state.hashCode ^ url.hashCode;
}
