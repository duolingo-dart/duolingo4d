// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/word_hint_adapter.dart';
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/response/wordhint/word_hint_response.dart';

/// This class provides the function to send a request
/// to fetch a word hint of an authenticated user.
///
/// This request requires the user to be authenticated in advance.
class WordHintRequest extends Request<WordHintResponse> {
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

  /// The adapter
  static final _adapter = WordHintAdapter.newInstance();

  @override
  Future<WordHintResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse(
            Uri.encodeFull(
              '${DuolingoApi.wordHint.url}/$learningLanguage/$fromLanguage?sentence=$sentence',
            ),
          ),
          headers: InternalSession.instance.headers,
        ),
      );
}
