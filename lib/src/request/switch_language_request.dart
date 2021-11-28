// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/session.dart';

class SwitchLanguageRequest extends Request {
  /// The required parameter for from language
  static const _paramFromLanguage = 'fromLanguage';

  /// The required parameter for learning language
  static const _paramLearningLanguage = 'learningLanguage';

  /// The internal constructor for singleton.
  SwitchLanguageRequest._internal();

  /// Returns the singleton instance of [SwitchLanguageRequest].
  factory SwitchLanguageRequest.getInstance() => _singletonInstance;

  /// The session
  static final _session = Session.getInstance();

  /// The singleton instance of [SwitchLanguageRequest].
  static final _singletonInstance = SwitchLanguageRequest._internal();

  @override
  Future<http.Response> send({
    final params = const <String, String>{},
  }) async {
    super.checkParameterKey(params: params, name: _paramFromLanguage);
    super.checkParameterKey(params: params, name: _paramLearningLanguage);

    return await http.post(
      Uri.parse(
        DuolingoApi.switchLanguage.url,
      ),
      headers: _session.headers,
      body: {
        'from_language': '${params[_paramFromLanguage]}',
        'learning_language': '${params[_paramLearningLanguage]}',
      },
    );
  }
}
