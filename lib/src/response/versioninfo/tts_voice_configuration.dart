// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:collection/collection.dart';

import 'package:duolingo4d/src/response/versioninfo/multi_voice_direction.dart';
import 'package:duolingo4d/src/response/versioninfo/voice_direction.dart';

/// This class represents the configuration about TTS voice.
class TtsVoiceConfiguration {
  /// Returns the new instance of [TtsVoiceConfiguration] based on arguments.
  TtsVoiceConfiguration.from({
    required this.path,
    required this.multiVoiceDirections,
    required this.voiceDirections,
  });

  /// The path for tts voice
  final String path;

  /// The multi voice directions
  final List<MultiVoiceDirection> multiVoiceDirections;

  /// The voice directions
  final List<VoiceDirection> voiceDirections;

  @override
  String toString() =>
      'TtsVoiceConfiguration(path: $path, multiVoiceDirections: $multiVoiceDirections, voiceDirections: $voiceDirections)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is TtsVoiceConfiguration &&
        other.path == path &&
        listEquals(other.multiVoiceDirections, multiVoiceDirections) &&
        listEquals(other.voiceDirections, voiceDirections);
  }

  @override
  int get hashCode =>
      path.hashCode ^ multiVoiceDirections.hashCode ^ voiceDirections.hashCode;
}
