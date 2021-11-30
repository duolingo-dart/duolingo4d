// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/entity/versioninfo/multi_voice_direction.dart';
import 'package:duolingo4d/src/entity/versioninfo/voice_direction.dart';

class TtsVoiceConfiguration {
  TtsVoiceConfiguration.from({
    required this.path,
    required this.multiVoiceDirections,
    required this.voiceDirections,
  });

  /// The path to voice data.
  final String path;

  final List<MultiVoiceDirection> multiVoiceDirections;

  final List<VoiceDirection> voiceDirections;
}
