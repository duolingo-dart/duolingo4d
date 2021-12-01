// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/overview/vocabulary.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

export 'package:duolingo4d/src/response/overview/vocabulary.dart';

class OverviewResponse extends Response {
  /// Returns the new instance of [OverviewResponse] based on arguments.
  OverviewResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.fromLanguage,
    required this.learningLanguage,
    required this.vocabularies,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  /// The vocabularies
  final List<Vocabulary> vocabularies;
}
