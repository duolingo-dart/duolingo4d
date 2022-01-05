// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/duolingo4d.dart';
import 'package:duolingo4d/src/adapter/stories_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/stories/stories_response.dart';

class StoriesRequest extends Request<StoriesResponse> {
  /// Returns the new instance of [StoriesRequest] based on arguments.
  StoriesRequest.from({
    required this.fromLanguage,
    required this.learningLanguage,
    required this.format,
  });

  /// The response adapter
  static final _adapter = StoriesAdapter.newInstance();

  /// The from langauge
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  /// The format
  final IllustrationFormat format;

  @override
  Future<StoriesResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse(
            '${Endpoint.story.url}/${Resource.stories.url}?fromLanguage=$fromLanguage&learningLanguage=$learningLanguage&illustrationFormat=${format.name}',
          ),
          headers: InternalSession.instance.headers,
        ),
      );
}
