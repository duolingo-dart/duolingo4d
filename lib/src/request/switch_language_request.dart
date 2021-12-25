// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/switch_language_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/switchlanguage/switch_language_response.dart';

/// This class provides the function to send a request
/// to switch learning language of an authenticated user.
///
/// This request requires the user to be authenticated in advance.
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

  /// The response adapter
  static final _adapter = SwitchLanguageAdapter.newInstance();

  /// The API uri
  static final _apiUri =
      Uri.parse('${Endpoint.base.url}/${Resource.switchLanguage.url}');

  @override
  Future<SwitchLanguageResponse> send() async => _adapter.convert(
        response: await http.post(
          _apiUri,
          headers: InternalSession.instance.headers,
          body: json.encode(
            {
              'from_language': fromLanguage,
              'learning_language': learningLanguage,
            },
          ),
        ),
      );
}
