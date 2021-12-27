// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/alphabets/alphabets_response.dart';

class AlphabetsAdapter extends Adapter<AlphabetsResponse> {
  /// Returns the new instance of [AlphabetsAdapter].
  AlphabetsAdapter.newInstance();

  @override
  AlphabetsResponse convert({
    required Response response,
  }) =>
      _buildAuthResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  /// Returns [AlphabetsResponse] based on [response] and [json].
  AlphabetsResponse _buildAuthResponse({
    required Response response,
    required JsonResponse json,
  }) =>
      AlphabetsResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        alphabets: _buildAlphabets(
          jsonList: json.getJsonList(key: 'alphabets'),
        ),
      );

  List<Alphabet> _buildAlphabets({
    required List<JsonResponse> jsonList,
  }) {
    final alphabets = <Alphabet>[];
    for (final json in jsonList) {
      alphabets.add(
        Alphabet.from(
          id: json.getString(key: 'id'),
          name: json.getString(key: 'name'),
          title: json.getString(key: 'title'),
          subtitle: json.getString(key: 'subtitle'),
          alphabetGroups: _buildAlphabetGroups(
            jsonList: json.getJsonList(key: 'groups'),
          ),
        ),
      );
    }

    return alphabets;
  }

  List<AlphabetGroup> _buildAlphabetGroups({
    required List<JsonResponse> jsonList,
  }) {
    final alphabetGroups = <AlphabetGroup>[];
    for (final json in jsonList) {
      alphabetGroups.add(
        AlphabetGroup.from(
          name: json.getString(key: 'id'),
          title: json.getString(key: 'title'),
          subtitle: json.getString(key: 'subtitle'),
          characters: _buildCharacters(
            jsonList: json.getJsonList(key: 'characters'),
          ),
        ),
      );
    }

    return alphabetGroups;
  }

  List<Character> _buildCharacters({
    required List<JsonResponse> jsonList,
  }) {
    final characters = <Character>[];
    for (final json in jsonList) {
      characters.add(
        Character.from(
          value: json.getString(key: 'character'),
          transliteration: json.getString(key: 'transliteration'),
          ttsUrl: json.getString(key: 'ttsUrl'),
          proficiency: json.getDouble(key: 'strength'),
        ),
      );
    }

    return characters;
  }
}
