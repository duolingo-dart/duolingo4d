// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:collection/collection.dart';

import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';
import 'package:duolingo4d/src/response/versioninfo/supported_direction.dart';
import 'package:duolingo4d/src/response/versioninfo/tts_voice_configuration.dart';

export 'package:duolingo4d/src/response/versioninfo/multi_voice_direction.dart';
export 'package:duolingo4d/src/response/versioninfo/supported_direction.dart';
export 'package:duolingo4d/src/response/versioninfo/tts_voice_configuration.dart';
export 'package:duolingo4d/src/response/versioninfo/voice_direction.dart';

/// This class represents the response entity of the Version Info API of the Duolingo API.
///
/// This entity object contains a lot of metadata about the Duolingo service.
/// For example, it contains [ttsVoiceConfiguration], which is related to the voice data
/// used for words, and [supportedDirections], which is a mapping table
/// between the language used for learning and the language being learned.
///
/// **_Example:_**
///
///```dart
///void main() async {
///  final duolingo = Duolingo.instance;
///
///  final versionInfoResponse = await duolingo.versionInfo();
///  final ttsVoiceConfiguration = versionInfoResponse.ttsVoiceConfiguration;
///
///  for (final voiceDirections in ttsVoiceConfiguration.voiceDirections) {
///    print(voiceDirections.language);
///    print(voiceDirections.voice);
///  }
///}
///```
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
    required this.speechHost,
    required this.ttsBaseUrl,
    required this.dictBaseUrl,
    required this.ttsVoiceConfiguration,
    required this.supportedDirections,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The CDN for TTS
  final String ttsCdnUrl;

  /// The age limit
  final int ageRestrictionLimit;

  /// The country code
  final String country;

  /// The base url for API
  final String apiBaseUrl;

  /// The host for speech
  final String speechHost;

  /// The base url for TTS
  final String ttsBaseUrl;

  /// The base url of dict
  final String dictBaseUrl;

  /// The TTS voice configuration
  final TtsVoiceConfiguration ttsVoiceConfiguration;

  /// The supported language directions
  final List<SupportedDirection> supportedDirections;

  @override
  String toString() {
    return 'VersionInfoResponse(ttsCdnUrl: $ttsCdnUrl, ageRestrictionLimit: $ageRestrictionLimit, country: $country, apiBaseUrl: $apiBaseUrl, speechHost: $speechHost, ttsBaseUrl: $ttsBaseUrl, dictBaseUrl: $dictBaseUrl, ttsVoiceConfiguration: $ttsVoiceConfiguration, supportedDirections: $supportedDirections)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is VersionInfoResponse &&
        other.ttsCdnUrl == ttsCdnUrl &&
        other.ageRestrictionLimit == ageRestrictionLimit &&
        other.country == country &&
        other.apiBaseUrl == apiBaseUrl &&
        other.speechHost == speechHost &&
        other.ttsBaseUrl == ttsBaseUrl &&
        other.dictBaseUrl == dictBaseUrl &&
        other.ttsVoiceConfiguration == ttsVoiceConfiguration &&
        listEquals(other.supportedDirections, supportedDirections);
  }

  @override
  int get hashCode {
    return ttsCdnUrl.hashCode ^
        ageRestrictionLimit.hashCode ^
        country.hashCode ^
        apiBaseUrl.hashCode ^
        speechHost.hashCode ^
        ttsBaseUrl.hashCode ^
        dictBaseUrl.hashCode ^
        ttsVoiceConfiguration.hashCode ^
        supportedDirections.hashCode;
  }
}
