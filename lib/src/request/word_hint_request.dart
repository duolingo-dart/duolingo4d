// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:duolingo4d/src/adapter/word_hint_api_adapter.dart';
import 'package:duolingo4d/src/entity/hint/word_hint_entity.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/session.dart';

class WordHintRequest extends Request<WordHintEntity> {
  /// Returns the new instance of [WordHintRequest] based on arguments.
  WordHintRequest.from({
    required this.fromLanguage,
    required this.learningLanguage,
    required this.sentence,
  });

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  /// The sentence
  final String sentence;

  /// The session
  static final _session = Session.getInstance();

  @override
  Future<WordHintEntity> send({
    final params = const <String, String>{},
  }) async =>
      WordHintApiAdapter().execute(
        response: await http.get(
          Uri.parse(
            Uri.encodeFull(
                '${DuolingoApi.wordHint.url}/$learningLanguage/$fromLanguage?sentence=$sentence'),
          ),
          headers: _session.headers,
        ),
      );
}
