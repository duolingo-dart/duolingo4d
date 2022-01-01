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
    required Json json,
  }) =>
      AlphabetsResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        alphabets: _buildAlphabets(
          jsonArray: json.getArray(key: 'alphabets'),
        ),
      );

  List<Alphabet> _buildAlphabets({
    required JsonArray jsonArray,
  }) {
    final alphabets = <Alphabet>[];
    jsonArray.forEach((json) {
      alphabets.add(
        Alphabet.from(
          id: json.getString(key: 'id'),
          name: json.getString(key: 'name'),
          title: json.getString(key: 'title'),
          subtitle: json.getString(key: 'subtitle'),
          groups: _buildAlphabetGroups(
            jsonArray: json.getArray(key: 'groups'),
          ),
        ),
      );
    });

    return alphabets;
  }

  List<AlphabetGroup> _buildAlphabetGroups({
    required JsonArray jsonArray,
  }) {
    final alphabetGroups = <AlphabetGroup>[];
    jsonArray.forEach((json) {
      alphabetGroups.add(
        AlphabetGroup.from(
          name: json.getString(key: 'id'),
          title: json.getString(key: 'title'),
          subtitle: json.getString(key: 'subtitle'),
          characterBook: _buildCharacterBook(
            jsonArray: json.getArray(key: 'characters'),
          ),
        ),
      );
    });

    return alphabetGroups;
  }

  CharacterBook _buildCharacterBook({
    required JsonArray jsonArray,
  }) =>
      CharacterBook.from(
        chapters: _buildCharacterChapters(
          jsonArray: jsonArray,
        ),
      );

  List<CharacterChapter> _buildCharacterChapters({
    required JsonArray jsonArray,
  }) {
    final characterChapters = <CharacterChapter>[];
    jsonArray.forEachArray((jsonArray) {
      characterChapters.add(
        CharacterChapter.from(
          contents: _buildCharacters(
            jsonArray: jsonArray,
          ),
        ),
      );
    });

    return characterChapters;
  }

  List<Character> _buildCharacters({
    required JsonArray jsonArray,
  }) {
    final characters = <Character>[];
    jsonArray.forEach((json) {
      characters.add(
        Character.from(
          value: json.getString(key: 'character'),
          transliteration: json.getString(key: 'transliteration'),
          ttsUrl: json.getString(key: 'ttsUrl'),
          proficiency: json.getDouble(key: 'strength'),
        ),
      );
    });

    return characters;
  }
}
