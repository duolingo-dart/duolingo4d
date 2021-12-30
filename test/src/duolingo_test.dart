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

  _testManifestApi();
  _testVersionInfoApi();
  _testUserApi();
  _testOverviewApi();
  _testWordHintApi();
  _testSwitchLanguageApi();
  _testActivity();
  _testDictionary();
  _testSubscriptions();
  _testShopItems();

  _testCachedVersionInfoApi();
  _testCachedUserApi();
  _testCachedOverviewApi();
  _testCachedWordHintApi();
  _testCachedActivity();
  _testCachedDictionary();

  //! Test the authentication API last,
  //! since duplicate authentication requests will affect other tests.
  _testAuthApi();
}

void _testManifestApi() {
  test('Test Manifest Request.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.manifest();

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.name.isNotEmpty, true);
    expect(response.icons.isNotEmpty, true);
    expect(response.backgroundColor.isNotEmpty, true);
    expect(response.themeColor.isNotEmpty, true);

    for (final icon in response.icons) {
      expect(icon.src.isNotEmpty, true);
      expect(icon.type.isNotEmpty, true);
      expect(icon.sizes.isNotEmpty, true);
    }
  });
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
    expect(response.currentCourse.skillBook.isNotEmpty, true);
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

void _testActivity() {
  test('Test Activity API.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.activity();

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.ranking.scores.isNotEmpty, true);
    expect(response.userIds.isNotEmpty, true);
  });
}

void _testDictionary() {
  test('Test Dictionary API.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.dictionary(
      wordId: '949c64079503b63ec9b795019476c27b',
    );

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);
  });
}

void _testSubscriptions() {
  test('Test Subscriptions API.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.subscriptions(
      userId: '557897808',
    );

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.friends.isNotEmpty, true);

    for (final friend in response.friends) {
      expect(friend.id.isNotEmpty, true);
      expect(friend.username.isNotEmpty, true);
      expect(friend.name.isNotEmpty, true);
      expect(friend.pictureUrl.isNotEmpty, true);
      expect(friend.weeklyXp > -1, true);
      expect(friend.monthlyXp > -1, true);
      expect(friend.totalXp > -1, true);
    }
  });
}

void _testShopItems() {
  test('Test Shop Items API.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.shopItems();

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.products.isNotEmpty, true);
  });
}

void _testCachedVersionInfoApi() {
  test('Test cached Version Info Request.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.cachedVersionInfo();

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(
        response.ttsVoiceConfiguration.multiVoiceDirections.isNotEmpty, true);
    expect(response.ttsVoiceConfiguration.voiceDirections.isNotEmpty, true);
    expect(response.supportedDirections.isNotEmpty, true);

    final cachedResponse = await duolingo.cachedVersionInfo();
    expect(response == cachedResponse, true);

    expect(cachedResponse.status.code, 200);
    expect(cachedResponse.status.reasonPhrase, 'OK');
    expect(cachedResponse.headers.isNotEmpty, true);

    expect(cachedResponse.ttsVoiceConfiguration.multiVoiceDirections.isNotEmpty,
        true);
    expect(
        cachedResponse.ttsVoiceConfiguration.voiceDirections.isNotEmpty, true);
    expect(cachedResponse.supportedDirections.isNotEmpty, true);
  });
}

void _testCachedUserApi() {
  test('Test User API.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.cachedUser(userId: '557897808');

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.id, '557897808');
    expect(response.username, 'duovoc_tes');
    expect(response.name, 'Duolingo4D');
    expect(response.courses.isNotEmpty, true);
    expect(response.currentCourse.skillBook.isNotEmpty, true);

    final cachedResponse = await duolingo.cachedUser(userId: '557897808');
    expect(response == cachedResponse, true);

    expect(cachedResponse.status.code, 200);
    expect(cachedResponse.status.reasonPhrase, 'OK');
    expect(cachedResponse.headers.isNotEmpty, true);

    expect(cachedResponse.id, '557897808');
    expect(cachedResponse.username, 'duovoc_tes');
    expect(cachedResponse.name, 'Duolingo4D');
    expect(cachedResponse.courses.isNotEmpty, true);
    expect(cachedResponse.currentCourse.skillBook.isNotEmpty, true);
  });
}

void _testCachedOverviewApi() {
  test('Test Overview API.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.cachedOverview();

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.vocabularies.isNotEmpty, true);

    final cachedResponse = await duolingo.cachedOverview();
    expect(response == cachedResponse, true);

    expect(cachedResponse.status.code, 200);
    expect(cachedResponse.status.reasonPhrase, 'OK');
    expect(cachedResponse.headers.isNotEmpty, true);

    expect(cachedResponse.vocabularies.isNotEmpty, true);
  });
}

void _testCachedWordHintApi() {
  test('Test Word Hint API.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.cachedWordHint(
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

    final cachedResponse = await duolingo.cachedWordHint(
      fromLanguage: 'en',
      learningLanguage: 'ja',
      sentence: 'ありがとう',
    );

    expect(response == cachedResponse, true);

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

void _testCachedActivity() {
  test('Test Activity API.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.cachedActivity();

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    expect(response.ranking.scores.isNotEmpty, true);
    expect(response.userIds.isNotEmpty, true);

    final cachedResponse = await duolingo.cachedActivity();
    expect(response == cachedResponse, true);

    expect(cachedResponse.status.code, 200);
    expect(cachedResponse.status.reasonPhrase, 'OK');
    expect(cachedResponse.headers.isNotEmpty, true);

    expect(cachedResponse.ranking.scores.isNotEmpty, true);
    expect(cachedResponse.userIds.isNotEmpty, true);
  });
}

void _testCachedDictionary() {
  test('Test Dictionary API.', () async {
    final duolingo = Duolingo.instance;
    final response = await duolingo.cachedDictionary(
      wordId: '949c64079503b63ec9b795019476c27b',
    );

    expect(response.status.code, 200);
    expect(response.status.reasonPhrase, 'OK');
    expect(response.headers.isNotEmpty, true);

    final cachedResponse = await duolingo.cachedDictionary(
      wordId: '949c64079503b63ec9b795019476c27b',
    );
    expect(response == cachedResponse, true);

    expect(cachedResponse.status.code, 200);
    expect(cachedResponse.status.reasonPhrase, 'OK');
    expect(cachedResponse.headers.isNotEmpty, true);
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
