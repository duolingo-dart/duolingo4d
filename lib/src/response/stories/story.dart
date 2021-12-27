// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/stories/illustration.dart';
import 'package:duolingo4d/src/response/stories/story_mode.dart';
import 'package:duolingo4d/src/response/stories/story_state.dart';

class Story {
  /// Returns the new instance of [Story] based on arguments.
  Story.from({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.state,
    required this.mode,
    required this.eligibleModes,
    required this.illustration,
    required this.awardXp,
    required this.isCompleted,
    required this.isVideo,
    required this.isMultipart,
  });

  /// The id
  final String id;

  /// The title
  final String title;

  /// The subtitle
  final String subtitle;

  /// The state
  final StoryState state;

  /// The mode
  final StoryMode mode;

  /// The eligible modes
  final List<StoryMode> eligibleModes;

  /// The illustration
  final Illustration illustration;

  /// The award xp
  final int awardXp;

  /// The flag that represents this story is completed or not
  final bool isCompleted;

  /// The flag that represents this story is video or not
  final bool isVideo;

  /// The flag that represents this story is multipart or not
  final bool isMultipart;

  @override
  String toString() {
    return 'Story(id: $id, title: $title, subtitle: $subtitle, state: $state, mode: $mode, eligibleModes: $eligibleModes, illustration: $illustration, awardXp: $awardXp, isCompleted: $isCompleted, isVideo: $isVideo, isMultipart: $isMultipart)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Story &&
        other.id == id &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.state == state &&
        other.mode == mode &&
        listEquals(other.eligibleModes, eligibleModes) &&
        other.illustration == illustration &&
        other.awardXp == awardXp &&
        other.isCompleted == isCompleted &&
        other.isVideo == isVideo &&
        other.isMultipart == isMultipart;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        state.hashCode ^
        mode.hashCode ^
        eligibleModes.hashCode ^
        illustration.hashCode ^
        awardXp.hashCode ^
        isCompleted.hashCode ^
        isVideo.hashCode ^
        isMultipart.hashCode;
  }
}
