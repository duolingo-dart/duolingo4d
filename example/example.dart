// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: avoid_print

import 'package:duolingo4d/duolingo4d.dart';

void main() async {
  // Get the singleton instance.
  final duolingo = Duolingo.instance;

  //! ---------- ↓ Authentication Does Not Required ↓ ----------

  // You can fetch metadata about the configuration of Duolingo.
  // ignore: unused_local_variable
  final versionInfoResponse = await duolingo.versionInfo();

  // You can authenticate user with this api.
  // You can use registered email address as a username.
  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  if (authResponse.status.isNotOk) {
    // Client or Server error or something.
    authResponse.status.reasonPhrase;
    authResponse.headers;
    return;
  }

  if (authResponse.hasError) {
    // When there is an error on authentication.
    final authError = authResponse.error!;
    authError.code;
    authError.reason;

    authError.isInvalidUser; // Returns true if user is invalid.
    authError.isInvalidPassword; // Returns true if password is invalid.
    return;
  }

  // You can fetch hint of word.
  // It is possible to specify not only words but also sentences in bulk.
  // ignore: unused_local_variable
  final wordHintResponse = await duolingo.wordHint(
    fromLanguage: 'en',
    learningLanguage: 'es',
    sentence: 'boligrafos',
  );

  for (final token in wordHintResponse.tokens) {
    final headers = token.table.headers;
    for (final header in headers) {
      print(header.token);
    }

    final rows = token.table.rows;
    for (final row in rows) {
      for (final cell in row.cells) {
        print(cell.hint);
      }
    }
  }

  //! ---------- ↑ Authentication Does Not Required ↑ ----------

  //! -------------- ↓ Authentication Required ↓ --------------

  // You can fetch user information based on user id.
  // ignore: unused_local_variable
  final userResponse = await duolingo.user(userId: authResponse.userId);

  // You can fetch all vocabularies you learned in Duolingo.
  // ignore: unused_local_variable
  final overviewResponse = await duolingo.overview();

  for (final vocabulary in overviewResponse.vocabularies) {
    print(vocabulary.word);
  }

  final switchLanguageResponse = await duolingo.switchLanguage(
    fromLanguage: 'es',
    learningLanguage: 'en',
  );

  print(switchLanguageResponse.status.code);
  print(switchLanguageResponse.status.reasonPhrase);

  final leaderboardResponse = await duolingo.leaderboard();

  print(leaderboardResponse.ranking);
  print(leaderboardResponse.userIds);

  final ranking = leaderboardResponse.ranking;
  print(ranking.orderByScoreNameDesc());
  print(ranking.orderByScoreXpDesc());

  for (final score in ranking.scores) {
    print(score.userId);
    print(score.xp);
  }

  //! -------------- ↑ Authentication Required ↑ --------------
}
