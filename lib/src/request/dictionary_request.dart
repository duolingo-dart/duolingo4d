// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/dictionary_api_adapter.dart';
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/response/dictionary/dictionary_response.dart';

class DictionaryRequest extends Request<DictionaryResponse> {
  /// Returns the new instance of [DictionaryRequest] based on arguments.
  DictionaryRequest.from({
    required this.wordId,
  });

  /// The response adapter
  static final _adapter = DictionaryApiAdapter.newInstance();

  /// The word id
  final String wordId;

  @override
  Future<DictionaryResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse('${DuolingoApi.dictionary.url}?lexeme_id=$wordId'),
          headers: InternalSession.instance.headers,
        ),
      );
}
