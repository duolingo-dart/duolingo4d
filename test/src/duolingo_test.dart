// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/duolingo4d.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await Duolingo.getInstance().authenticate(
    username: 'duovoc_tes',
    password: 'test_duolingo4d',
  );

  test('Test Version Info Request.', () async {
    final duolingo = Duolingo.getInstance();
    final response = await duolingo.versionInfo();

    expect(response.statusCode, 200);
    expect(response.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(
        response.ttsVoiceConfiguration.multiVoiceDirections.isNotEmpty, true);
    expect(response.ttsVoiceConfiguration.voiceDirections.isNotEmpty, true);
    expect(response.supportedDirections.isNotEmpty, true);
  });

  test('Test User API.', () async {
    final duolingo = Duolingo.getInstance();
    final userResponse = await duolingo.user(userId: '557897808');

    expect(userResponse.statusCode, 200);
    expect(userResponse.reasonPhrase, 'OK');
    expect(userResponse.headers.isNotEmpty, true);

    expect(userResponse.id, 557897808);
    expect(userResponse.username, 'duovoc_tes');
    expect(userResponse.name, 'Duolingo4D');
    expect(userResponse.courses.isNotEmpty, true);
    expect(userResponse.currentCourse.skills.isNotEmpty, true);
  });

  test('Test Auth Request.', () async {
    final duolingo = Duolingo.getInstance();
    final response = await duolingo.authenticate(
      username: 'duovoc_tes',
      password: 'test_duolingo4d',
    );

    expect(response.statusCode, 200);
    expect(response.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.hasNotError, true);
    expect(response.userId, '557897808');
    expect(response.username, 'duovoc_tes');
  });

  test('Test duplicated Auth Request.', () async {
    final duolingo = Duolingo.getInstance();
    final response = await duolingo.authenticate(
      username: 'duovoc_tes',
      password: 'test_duolingo4d',
    );

    expect(response.statusCode, 200);
    expect(response.reasonPhrase, 'OK');
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
    final duolingo = Duolingo.getInstance();
    final response = await duolingo.authenticate(
      username: '',
      password: 'test_duolingo4d',
    );

    expect(response.statusCode, 200);
    expect(response.reasonPhrase, 'OK');
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
    final duolingo = Duolingo.getInstance();
    final response = await duolingo.authenticate(
      username: 'duovoc_tes',
      password: '',
    );

    expect(response.statusCode, 200);
    expect(response.reasonPhrase, 'OK');
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
