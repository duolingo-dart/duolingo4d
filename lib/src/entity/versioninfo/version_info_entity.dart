// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/entity/response_entity.dart';
import 'package:duolingo4d/src/entity/versioninfo/supported_direction.dart';
import 'package:duolingo4d/src/entity/versioninfo/tts_voice_configuration.dart';

export 'package:duolingo4d/src/entity/versioninfo/tts_voice_configuration.dart';
export 'package:duolingo4d/src/entity/versioninfo/multi_voice_direction.dart';
export 'package:duolingo4d/src/entity/versioninfo/voice_direction.dart';
export 'package:duolingo4d/src/entity/versioninfo/supported_direction.dart';

class VersionInfoEntity extends ResponseEntity {
  /// Returns the new instance of [VersionInfoEntity] based on arguments.
  VersionInfoEntity.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.ttsCdnUrl,
    required this.ageRestrictionLimit,
    required this.country,
    required this.apiBaseUrl,
    required this.speachHost,
    required this.ttsBaseUrl,
    required this.dictBaseUrl,
    required this.ttsVoiceConfiguration,
    required this.supportedDirections,
  }) : super.from(
          statusCode: statusCode,
          reasonPhrase: reasonPhrase,
          headers: headers,
        );

  final String ttsCdnUrl;

  final int ageRestrictionLimit;

  final String country;

  final String apiBaseUrl;

  final String speachHost;

  final String ttsBaseUrl;

  final String dictBaseUrl;

  final TtsVoiceConfiguration ttsVoiceConfiguration;

  final List<SupportedDirection> supportedDirections;
}
