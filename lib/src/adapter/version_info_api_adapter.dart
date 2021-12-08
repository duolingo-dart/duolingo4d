// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/adapter/json.dart';
import 'package:duolingo4d/src/response/versioninfo/version_info_response.dart';

/// This class provides the function to convert the response
/// returned from the version info API into the [VersionInfoResponse] format.
class VersionInfoAdapter extends Adapter<VersionInfoResponse> {
  /// Returns the new instance of [VersionInfoAdapter].
  VersionInfoAdapter.newInstance();

  @override
  VersionInfoResponse convert({
    required Response response,
  }) =>
      _buildVersionInfoResponse(
        response: response,
        json: Json.fromBytes(bytes: response.bodyBytes),
      );

  /// Returns [VersionInfoResponse] based on [response] and [json].
  VersionInfoResponse _buildVersionInfoResponse({
    required Response response,
    required Json json,
  }) =>
      VersionInfoResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        ttsCdnUrl: json.getStringValue(key: 'tts_cdn_url'),
        ageRestrictionLimit: json.getIntValue(
          key: 'age_restriction_limit',
        ),
        country: json.getStringValue(key: 'country'),
        apiBaseUrl: json.getStringValue(key: 'api_base_url'),
        speechHost: json.getStringValue(key: 'speech_host'),
        ttsBaseUrl: json.getStringValue(key: 'tts_base_url'),
        dictBaseUrl: json.getStringValue(key: 'dict_base_url'),
        ttsVoiceConfiguration: _buildTtsVoiceConfiguration(
          json: json.getJson(key: 'tts_voice_configuration'),
        ),
        supportedDirections: _buildSupportedDirections(
          json: json.getJson(key: 'supported_directions'),
        ),
      );

  /// Returns [TtsVoiceConfiguration] based on [json].
  TtsVoiceConfiguration _buildTtsVoiceConfiguration({
    required Json json,
  }) {
    return TtsVoiceConfiguration.from(
      path: json.getStringValue(key: 'path'),
      multiVoiceDirections: _buildMultiVoiceDirections(
        json: json.getJson(key: 'multi_voices'),
      ),
      voiceDirections: _buildVoiceDirections(
        json: json.getJson(key: 'voices'),
      ),
    );
  }

  /// Returns [MultiVoiceDirection] list based on [json].
  List<MultiVoiceDirection> _buildMultiVoiceDirections({
    required Json json,
  }) {
    final multiVoiceDirections = <MultiVoiceDirection>[];

    for (final key in json.keySet) {
      multiVoiceDirections.add(
        MultiVoiceDirection.from(
          language: key,
          voices: json.getStringValues(key: key),
        ),
      );
    }

    return multiVoiceDirections;
  }

  /// Returns [VoiceDirection] list based on [json].
  List<VoiceDirection> _buildVoiceDirections({
    required Json json,
  }) {
    final voiceDirections = <VoiceDirection>[];

    for (final key in json.keySet) {
      voiceDirections.add(
        VoiceDirection.from(
          language: key,
          voice: json.getStringValue(key: key),
        ),
      );
    }

    return voiceDirections;
  }

  /// Returns [SupportedDirection] list based on [json].
  List<SupportedDirection> _buildSupportedDirections({
    required Json json,
  }) {
    final supportedDirections = <SupportedDirection>[];

    for (final key in json.keySet) {
      supportedDirections.add(
        SupportedDirection.from(
          fromLanguage: key,
          learningLanguages: json.getStringValues(key: key),
        ),
      );
    }

    return supportedDirections;
  }
}
