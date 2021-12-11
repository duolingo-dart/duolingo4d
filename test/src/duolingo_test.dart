// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:sweet_cookie_jar/sweet_cookie_jar.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:duolingo4d/duolingo4d.dart';

void main() async {
  test('Test Authentication API and Session', () async {
    DuolingoSession session = Duolingo.instance.session;
    expect(session.requestHeader.cookie.rawData.isEmpty, true);
    expect(session.requestHeader.cookie.jwtToken.isEmpty, true);
    expect(session.requestHeader.cookie.csrfTokens.isEmpty, true);

    await Duolingo.instance.authenticate(
      username: 'duovoc_tes',
      password: 'test_duolingo4d',
    );

    session = Duolingo.instance.session;
    expect(session.requestHeader.cookie.rawData.isNotEmpty, true);
    expect(session.requestHeader.cookie.jwtToken.isNotEmpty, true);
    expect(session.requestHeader.cookie.csrfTokens.isNotEmpty, true);
  });

  _testVersionInfoApi();
  _testUserApi();
  _testOverviewApi();
  _testWordHintApi();
  _testSwitchLanguageApi();
  _testLeaderboard();

  //! Test the authentication API last,
  //! since duplicate authentication requests will affect other tests.
  _testAuthApi();
}

void _testVersionInfoApi() {
  test('Test Version Info Request.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.versionInfo();

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(
        response.ttsVoiceConfiguration.multiVoiceDirections.isNotEmpty, true);
    expect(response.ttsVoiceConfiguration.voiceDirections.isNotEmpty, true);
    expect(response.supportedDirections.isNotEmpty, true);
  });
}

void _testUserApi() {
  test('Test User API.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.user(userId: '557897808');

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.id, '557897808');
    expect(response.username, 'duovoc_tes');
    expect(response.name, 'Duolingo4D');
    expect(response.courses.isNotEmpty, true);
    expect(response.currentCourse.skills.isNotEmpty, true);
  });
}

void _testOverviewApi() {
  test('Test Overview API.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.overview();

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.vocabularies.isNotEmpty, true);
  });
}

void _testWordHintApi() {
  test('Test Word Hint API.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.wordHint(
      fromLanguage: 'en',
      learningLanguage: 'ja',
      sentence: 'ありがとう',
    );

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.tokens.isNotEmpty, true);
    expect(response.tokens[0].table.headers.isNotEmpty, true);
    expect(response.tokens[0].table.rows.isNotEmpty, true);
    expect(response.tokens[0].table.rows[0].cells.isNotEmpty, true);
    expect(response.tokens[0].table.references.isNotEmpty, true);
  });
}

void _testSwitchLanguageApi() {
  test('Test Switch Language API.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.switchLanguage(
      fromLanguage: 'en',
      learningLanguage: 'ja',
    );

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);
  });
}

void _testLeaderboard() {
  test('Test Leaderboard API.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.leaderboard();

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.ranking.scores.isNotEmpty, true);
    expect(response.userIds.isNotEmpty, true);
  });
}

void _testAuthApi() {
  test('Test Auth Request.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.authenticate(
      username: 'duovoc_tes',
      password: 'test_duolingo4d',
    );

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.hasNotError, true);
    expect(response.userId, '557897808');
    expect(response.username, 'duovoc_tes');
  });

  test('Test duplicated Auth Request.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.authenticate(
      username: 'duovoc_tes',
      password: 'test_duolingo4d',
    );

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.hasError, true);
    expect(response.userId, '');
    expect(response.username, '');

    final authError = response.error!;
    expect(authError.code, 'invalid_password');
    expect(authError.reason, 'Failed login');
    expect(authError.isInvalidUser, false);
    expect(authError.isInvalidPassword, true);
  });

  test('Test Auth Request with invalid user.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.authenticate(
      username: '',
      password: 'test_duolingo4d',
    );

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.hasError, true);
    expect(response.userId, '');
    expect(response.username, '');

    final authError = response.error!;
    expect(authError.code, 'user_does_not_exist');
    expect(authError.reason, 'Failed login');
    expect(authError.isInvalidUser, true);
    expect(authError.isInvalidPassword, false);
  });

  test('Test Auth Request with invalid password.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.authenticate(
      username: 'duovoc_tes',
      password: '',
    );

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.hasError, true);
    expect(response.userId, '');
    expect(response.username, '');

    final authError = response.error!;
    expect(authError.code, 'invalid_password');
    expect(authError.reason, 'Failed login');
    expect(authError.isInvalidUser, false);
    expect(authError.isInvalidPassword, true);
  });
}
