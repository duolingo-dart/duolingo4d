// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/alphabets_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/alphabets/alphabets_response.dart';

class AlphabetsRequest extends Request<AlphabetsResponse> {
  /// Returns the new instance of [AlphabetsRequest].
  AlphabetsRequest.from({
    required this.fromLanguage,
    required this.learningLanguage,
  });

  /// The response adapter
  static final _adapter = AlphabetsAdapter.newInstance();

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  @override
  Future<AlphabetsResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse(
            '${Endpoint.baseProd.url}/${Resource.alphabets.url}/$learningLanguage/$fromLanguage',
          ),
          headers: InternalSession.instance.headers,
        ),
      );
}
