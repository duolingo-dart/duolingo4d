// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Flutter imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/entity/versioninfo/multi_voice_direction.dart';
import 'package:duolingo4d/src/entity/versioninfo/supported_directions.dart';
import 'package:duolingo4d/src/entity/versioninfo/tts_voice_configuration.dart';
import 'package:duolingo4d/src/entity/versioninfo/version_info_entity.dart';
import 'package:duolingo4d/src/entity/versioninfo/voice_direction.dart';
import 'package:duolingo4d/src/json_response.dart';

// Project imports:
import 'package:http/http.dart';

class VersionInfoAdapter extends Adapter<VersionInfoEntity> {
  @override
  Future<VersionInfoEntity> execute({
    required Response response,
  }) async {
    final jsonResponseBody = JsonResponse.fromJsonString(value: response.body);

    return VersionInfoEntity.from(
      statusCode: response.statusCode,
      reasonPhrase: response.reasonPhrase ?? '',
      headers: response.headers,
      ttsCdnUrl: jsonResponseBody.getStringValue(key: 'tts_cdn_url'),
      ageRestrictionLimit: jsonResponseBody.getIntValue(
        key: 'age_restriction_limit',
      ),
      country: jsonResponseBody.getStringValue(key: 'country'),
      apiBaseUrl: jsonResponseBody.getStringValue(key: 'api_base_url'),
      speachHost: jsonResponseBody.getStringValue(key: 'speech_host'),
      ttsBaseUrl: jsonResponseBody.getStringValue(key: 'tts_base_url'),
      dictBaseUrl: jsonResponseBody.getStringValue(key: 'dict_base_url'),
      ttsVoiceConfiguration: _buildTtsVoiceConfiguration(
        jsonResponse: jsonResponseBody.childJsonMap(
          key: 'tts_voice_configuration',
        ),
      ),
      supportedDirections: _buildSupportedDirections(
        jsonResponse: jsonResponseBody.childJsonMap(
          key: 'supported_directions',
        ),
      ),
    );
  }

  TtsVoiceConfiguration _buildTtsVoiceConfiguration({
    required JsonResponse jsonResponse,
  }) {
    return TtsVoiceConfiguration.from(
      path: jsonResponse.getStringValue(key: 'path'),
      multiVoiceDirections: _buildMultiVoiceDirections(
        jsonResponse: jsonResponse.childJsonString(
          key: 'multi_voices',
        ),
      ),
      voiceDirections: _buildVoiceDirections(
        jsonResponse: jsonResponse.childJsonString(
          key: 'voices',
        ),
      ),
    );
  }

  List<MultiVoiceDirection> _buildMultiVoiceDirections({
    required JsonResponse jsonResponse,
  }) {
    final multiVoiceDirections = <MultiVoiceDirection>[];

    for (final key in jsonResponse.keySet) {
      multiVoiceDirections.add(
        MultiVoiceDirection.from(
          language: key,
          voices: jsonResponse.getValues(key: key),
        ),
      );
    }

    return multiVoiceDirections;
  }

  List<VoiceDirection> _buildVoiceDirections({
    required JsonResponse jsonResponse,
  }) {
    final voiceDirections = <VoiceDirection>[];

    for (final key in jsonResponse.keySet) {
      voiceDirections.add(
        VoiceDirection.from(
          language: key,
          voice: jsonResponse.getStringValue(key: key),
        ),
      );
    }

    return voiceDirections;
  }

  List<SupportedDirection> _buildSupportedDirections({
    required JsonResponse jsonResponse,
  }) {
    final supportedDirections = <SupportedDirection>[];

    for (final key in jsonResponse.keySet) {
      supportedDirections.add(
        SupportedDirection.from(
          fromLanguage: key,
          learningLanguages: jsonResponse.getValues(key: key),
        ),
      );
    }

    return supportedDirections;
  }
}
