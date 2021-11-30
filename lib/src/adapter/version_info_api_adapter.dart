// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/json.dart';
import 'package:duolingo4d/src/response/versioninfo/multi_voice_direction.dart';
import 'package:duolingo4d/src/response/versioninfo/supported_direction.dart';
import 'package:duolingo4d/src/response/versioninfo/tts_voice_configuration.dart';
import 'package:duolingo4d/src/response/versioninfo/version_info_response.dart';
import 'package:duolingo4d/src/response/versioninfo/voice_direction.dart';

class VersionInfoAdapter extends Adapter<VersionInfoResponse> {
  @override
  VersionInfoResponse execute({
    required Response response,
  }) =>
      _buildVersionInfoResponse(
        response: response,
        json: Json.fromJsonString(value: response.body),
      );

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
        speachHost: json.getStringValue(key: 'speech_host'),
        ttsBaseUrl: json.getStringValue(key: 'tts_base_url'),
        dictBaseUrl: json.getStringValue(key: 'dict_base_url'),
        ttsVoiceConfiguration: _buildTtsVoiceConfiguration(
          json: json.childJsonMap(key: 'tts_voice_configuration'),
        ),
        supportedDirections: _buildSupportedDirections(
          json: json.childJsonMap(key: 'supported_directions'),
        ),
      );

  TtsVoiceConfiguration _buildTtsVoiceConfiguration({
    required Json json,
  }) {
    return TtsVoiceConfiguration.from(
      path: json.getStringValue(key: 'path'),
      multiVoiceDirections: _buildMultiVoiceDirections(
        json: json.childJsonString(key: 'multi_voices'),
      ),
      voiceDirections: _buildVoiceDirections(
        json: json.childJsonString(key: 'voices'),
      ),
    );
  }

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
