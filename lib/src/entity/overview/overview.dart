// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/entity/overview/vocabulary.dart';
import 'package:duolingo4d/src/entity/response.dart';

export 'package:duolingo4d/src/entity/overview/vocabulary.dart';

class Overview extends Response {
  /// Returns the new instance of [Overview] based on arguments.
  Overview.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.fromLanguage,
    required this.learningLanguage,
    required this.vocabularies,
  }) : super.from(
          statusCode: statusCode,
          reasonPhrase: reasonPhrase,
          headers: headers,
        );

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  /// The vocabularies
  final List<Vocabulary> vocabularies;
}
