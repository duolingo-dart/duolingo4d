// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/switch_language_api_adapter.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/response/switchlanguage/switch_language.dart';
import 'package:duolingo4d/src/session.dart';

class SwitchLanguageRequest extends Request<SwitchLanguageResponse> {
  /// Returns the new instance of [SwitchLanguageRequest] based on arguments.
  SwitchLanguageRequest.from({
    required this.fromLanguage,
    required this.learningLanguage,
  });

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  /// The API uri
  static final _apiUri = Uri.parse('https://www.duolingo.com/switch_language');

  /// The session
  static final _session = Session.getInstance();

  @override
  Future<SwitchLanguageResponse> send() async =>
      SwitchLanguageApiAdapter().execute(
        response: await http.post(
          _apiUri,
          headers: _session.headers,
          body: {
            'from_language': fromLanguage,
            'learning_language': learningLanguage,
          },
        ),
      );
}
