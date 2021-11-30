// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/versioninfo/supported_direction.dart';
import 'package:duolingo4d/src/response/versioninfo/tts_voice_configuration.dart';

export 'package:duolingo4d/src/response/versioninfo/tts_voice_configuration.dart';
export 'package:duolingo4d/src/response/versioninfo/multi_voice_direction.dart';
export 'package:duolingo4d/src/response/versioninfo/voice_direction.dart';
export 'package:duolingo4d/src/response/versioninfo/supported_direction.dart';

class VersionInfoResponse extends Response {
  /// Returns the new instance of [VersionInfoResponse] based on arguments.
  VersionInfoResponse.from({
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
