// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/achievements_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/achievements/achievements_response.dart';

class AchievementsRequest extends Request<AchievementsResponse> {
  /// Returns the new instance of [AchievementsRequest] based on arguments.
  AchievementsRequest.from({
    required this.userId,
    required this.fromLanguage,
    required this.learningLanguage,
  });

  /// The response adapter
  static final _adapter = AchievementsAdapter.newInstance();

  /// The user id
  final String userId;

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  @override
  Future<AchievementsResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse(
            '${Endpoint.achievement.url}/${Resource.achievements.url}/$userId/achievements?fromLanguage=$fromLanguage&learningLanguage=$learningLanguage',
          ),
          headers: InternalSession.instance.headers,
        ),
      );
}
