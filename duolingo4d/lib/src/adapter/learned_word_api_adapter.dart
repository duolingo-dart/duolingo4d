// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:duolingo4d/src/adapter/adapter.dart';

// Project imports:
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/http_status.dart';
import 'package:http/http.dart';

class LearnedWordApiAdapter extends Adapter {
  @override
  Future<void> execute({
    required Response response,
  }) async {
    try {
      final response = await DuolingoApi.learnedWord.request.send();
      final httpStatus = HttpStatus.from(code: response.statusCode);

      if (httpStatus.isAccepted) {
        final jsonMap = jsonDecode(response.body);
        final String languageString = jsonMap['language_string'];
        final String learningLanguage = jsonMap['learning_language'];
        final String fromLanguage = jsonMap['from_language'];
      }
    } catch (e) {}
  }
}
