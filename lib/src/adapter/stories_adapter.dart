// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/stories/stories_response.dart';

class StoriesAdapter extends Adapter<StoriesResponse> {
  /// Returns the new instance of [StoriesAdapter].
  StoriesAdapter.newInstance();

  @override
  StoriesResponse convert({
    required Response response,
  }) =>
      _buildStoriesResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  StoriesResponse _buildStoriesResponse({
    required Response response,
    required Json json,
  }) =>
      StoriesResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        stories: _buildStories(
          jsonArray: json.getArray(key: 'sets'),
        ),
      );

  List<Story> _buildStories({
    required JsonArray jsonArray,
  }) {
    final stories = <Story>[];
    jsonArray.forEach((json) {
      final state = _getStoryState(
        code: json.getString(key: 'state').toLowerCase(),
      );

      stories.add(
        Story.from(
          id: json.getString(key: 'id'),
          title: json.getString(key: 'title'),
          subtitle: json.getString(key: 'subtitle'),
          state: state,
          mode: _getStoryMode(
            code: json.getString(key: 'currentMode').toLowerCase(),
          ),
          eligibleModes: _getEligibleModes(
            codes: json.getStringValues(key: 'eligibleModes'),
          ),
          illustration: _buildIllustrations(
            state: state,
            json: json.get(key: 'illustrationUrls'),
          ),
          awardXp: json.getInt(key: 'xpToAward'),
          isCompleted: json.getBool(key: 'completed'),
          isVideo: json.getBool(key: 'isVideo'),
          isMultipart: json.getBool(key: 'isMultipart'),
        ),
      );
    });

    return stories;
  }

  StoryState _getStoryState({
    required String code,
  }) {
    for (final state in StoryState.values) {
      if (state.name == code) {
        return state;
      }
    }

    return StoryState.locked;
  }

  StoryMode _getStoryMode({
    required String code,
  }) {
    for (final mode in StoryMode.values) {
      if (mode.name == code) {
        return mode;
      }
    }

    return StoryMode.read;
  }

  List<StoryMode> _getEligibleModes({required List<String> codes}) {
    final storyModes = <StoryMode>[];
    for (final code in codes) {
      storyModes.add(
        _getStoryMode(
          code: code.toLowerCase(),
        ),
      );
    }

    return storyModes;
  }

  Illustration _buildIllustrations({
    required StoryState state,
    required Json json,
  }) {
    for (final key in json.keySet) {
      if (state.name == key) {
        return Illustration.from(
          state: state,
          url: json.getString(key: key),
        );
      }
    }

    // It should not happen.
    throw UnimplementedError();
  }
}
