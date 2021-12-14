// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/duolingo_impl.dart';
import 'package:duolingo4d/src/duolingo_session.dart';
import 'package:duolingo4d/src/response/auth/auth_response.dart';
import 'package:duolingo4d/src/response/leaderboard/leaderboard_response.dart';
import 'package:duolingo4d/src/response/overview/overview_response.dart';
import 'package:duolingo4d/src/response/switchlanguage/switch_language_response.dart';
import 'package:duolingo4d/src/response/user/user_response.dart';
import 'package:duolingo4d/src/response/versioninfo/version_info_response.dart';
import 'package:duolingo4d/src/response/wordhint/word_hint_response.dart';

/// This class provides the features to access the Duolingo API easily.
abstract class Duolingo {
  /// Returns the singleton instance of [Duolingo].
  static Duolingo get instance => DuolingoImpl.instance;

  /// Returns the session information when communicating with the Duolingo API.
  ///
  /// This session is created when the user is successfully authenticated by [authenticate],
  /// so if this [session] method is called before the user's authentication is completed,
  /// empty session information will be returned.
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() {
  ///  final session = Duolingo.instance.session;
  ///
  ///  // You can get request headers as map.
  ///  print(session.requestHeader.toMap());
  ///
  ///  // You can use cookie and authorization header.
  ///  print(session.requestHeader.cookie);
  ///  print(session.requestHeader.authHeader);
  ///}
  ///```
  DuolingoSession get session;

  /// Returns metadata about the configuration of the Duolingo service.
  ///
  /// A call to this method will always cause a communication process with the Duolingo API.
  /// If you want to reuse the cached response object, use [cachedVersionInfo].
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final versionInfoResponse = await duolingo.versionInfo();
  ///  final ttsVoiceConfiguration = versionInfoResponse.ttsVoiceConfiguration;
  ///
  ///  for (final voiceDirection in ttsVoiceConfiguration.voiceDirections) {
  ///    print(voiceDirection.language);
  ///    print(voiceDirection.voice);
  ///  }
  ///}
  ///```
  Future<VersionInfoResponse> versionInfo();

  /// Authenticate the user using the user information provided as an argument.
  ///
  /// The [username] argument should not only be a username,
  /// but also an email address that has already been authenticated by Duolingo.
  ///
  /// If a user who has already been authenticated tries to authenticate again,
  /// the API will return an invalid password error.
  ///
  /// When the user associated with [username] and [password] is authenticated,
  /// there is no need to call [cleanCache] or any other method to delete the cache
  /// when the user is authenticated. The cache information will be cleaned automatically.
  ///
  /// **_Example:_**
  ///
  /// ```dart
  /// void main() async {
  ///   final duolingo = Duolingo.instance;
  ///
  ///   final authResponse = await duolingo.authenticate(
  ///     username: 'test_username',
  ///     password: 'test_password',
  ///   );
  ///
  ///   if (authResponse.status.isNotOk) {
  ///     authResponse.status.reasonPhrase;
  ///     authResponse.headers;
  ///     return;
  ///   }
  ///
  ///   if (authResponse.hasError) {
  ///     final authError = authResponse.error!;
  ///     print(authError.code);
  ///     print(authError.reason);
  ///
  ///     authError.isInvalidUser;
  ///     authError.isInvalidPassword;
  ///     return;
  ///   }
  /// }
  /// ```
  Future<AuthResponse> authenticate({
    required String username,
    required String password,
  });

  /// Returns the authenticated user information from [userId].
  ///
  /// A call to this method will always cause a communication process with the Duolingo API.
  /// If you want to reuse the cached response object, use [cachedUser].
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final authResponse = await duolingo.authenticate(
  ///    username: 'test_username',
  ///    password: 'test_password',
  ///  );
  ///
  ///  final userResponse = await duolingo.user(userId: authResponse.userId);
  ///
  ///  print(userResponse.name);
  ///  print(userResponse.lingots);
  ///
  ///  for (final course in userResponse.courses) {
  ///    print(course.title);
  ///    print(course.xp);
  ///  }
  ///
  ///  for (final skill in userResponse.currentCourse.skills) {
  ///    if (skill.isAccessible) {
  ///       print(skill.name);
  ///       print(skill.proficiency);
  ///       print(skill.tipsAndNotes);
  ///    }
  ///  }
  ///}
  ///```
  Future<UserResponse> user({
    required String userId,
  });

  /// Returns all learned words associated with the language that
  /// the authenticated user is currently learning.
  ///
  /// A call to this method will always cause a communication process with the Duolingo API.
  /// If you want to reuse the cached response object, use [cachedOverview].
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final authResponse = await duolingo.authenticate(
  ///    username: 'test_username',
  ///    password: 'test_password',
  ///  );
  ///
  ///  final overviewResponse = await duolingo.overview();
  ///
  ///  for (final vocabulary in overviewResponse.vocabularies) {
  ///      print(vocabulary.word);
  ///  }
  ///}
  ///```
  Future<OverviewResponse> overview();

  /// Returns the hint information of [sentence] specified in the argument.
  ///
  /// For [fromLanguage], specify the language of the hint information,
  /// and for [learningLanguage], specify the language of the word
  /// or sentence specified in [sentence].
  ///
  /// A call to this method will always cause a communication process with the Duolingo API.
  /// If you want to reuse the cached response object, use [cachedWordHint].
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final authResponse = await duolingo.authenticate(
  ///    username: 'test_username',
  ///    password: 'test_password',
  ///  );
  ///
  ///  final wordHintResponse = await duolingo.wordHint(
  ///    fromLanguage: 'en',
  ///    learningLanguage: 'es',
  ///    sentence: 'bolígrafos',
  ///  );
  ///
  ///  for (final token in wordHintResponse.tokens) {
  ///    final headers = token.table.headers;
  ///    for (final header in headers) {
  ///      print(header.selected);
  ///      print(header.token);
  ///    }
  ///
  ///    final rows = token.table.rows;
  ///    for (final row in rows) {
  ///      for (final cell in row.cells) {
  ///        print(cell.hint);
  ///      }
  ///    }
  ///  }
  ///}
  ///```
  Future<WordHintResponse> wordHint({
    required String fromLanguage,
    required String learningLanguage,
    required String sentence,
  });

  /// Switches the learning language for authenticated users.
  Future<SwitchLanguageResponse> switchLanguage({
    required String fromLanguage,
    required String learningLanguage,
  });

  /// Returns the leaderboard information of the authenticated user.
  ///
  /// A call to this method will always cause a communication process with the Duolingo API.
  /// If you want to reuse the cached response object, use [cachedLeaderboard].
  ///
  /// ```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final authResponse = await duolingo.authenticate(
  ///    username: 'test_username',
  ///    password: 'test_password',
  ///  );
  ///
  ///  final leaderboardResponse = await duolingo.leaderboard();
  ///
  ///  print(leaderboardResponse.ranking);
  ///  print(leaderboardResponse.userIds);
  ///
  ///  final ranking = leaderboardResponse.ranking;
  ///
  ///  // You can order ranking by score item.
  ///  print(ranking.orderByScoreNameDesc());
  ///  print(ranking.orderByScoreXpDesc());
  ///
  ///  for (final score in ranking.scores) {
  ///    print(score.userId);
  ///    print(score.xp);
  ///  }
  ///}
  /// ```
  Future<LeaderboardResponse> leaderboard();

  /// Returns cached metadata about the configuration of the Duolingo service.
  ///
  /// The first call to this [cachedVersionInfo] method will always result in a communication with the Duolingo API
  /// because there is no cached [VersionInfoResponse]. In the second and subsequent method calls, the cached [VersionInfoResponse]
  /// from the first method call will be returned.
  ///
  /// The type and data structure of the response is consistent with the [versionInfo] method. However, please note that
  /// the cached data is returned from this method, so unless you explicitly delete this cached object data,
  /// the cached response object will always be returned.
  ///
  /// To delete the explicitly cached [VersionInfoResponse], call the [cleanCacheVersionInfo] method.
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final versionInfoResponse = await duolingo.cachedVersionInfo();
  ///  final ttsVoiceConfiguration = versionInfoResponse.ttsVoiceConfiguration;
  ///
  ///  for (final voiceDirection in ttsVoiceConfiguration.voiceDirections) {
  ///    print(voiceDirection.language);
  ///    print(voiceDirection.voice);
  ///  }
  ///
  ///  // Delete cache.
  ///  duolingo.cleanCacheVersionInfo();
  ///}
  ///```
  Future<VersionInfoResponse> cachedVersionInfo();

  /// Returns cached the authenticated user information from [userId].
  ///
  /// The first call to this [cachedUser] method will always result in a communication with the Duolingo API
  /// because there is no cached [UserResponse]. In the second and subsequent method calls, the cached [UserResponse]
  /// from the first method call will be returned.
  ///
  /// The type and data structure of the response is consistent with the [user] method. However, please note that
  /// the cached data is returned from this method, so unless you explicitly delete this cached object data,
  /// the cached response object will always be returned.
  ///
  /// To delete the explicitly cached [UserResponse], call the [cleanCachedUser] method.
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final authResponse = await duolingo.authenticate(
  ///    username: 'test_username',
  ///    password: 'test_password',
  ///  );
  ///
  ///  final userResponse = await duolingo.cachedUser(userId: authResponse.userId);
  ///
  ///  print(userResponse.name);
  ///  print(userResponse.lingots);
  ///
  ///  for (final course in userResponse.courses) {
  ///    print(course.title);
  ///    print(course.xp);
  ///  }
  ///
  ///  for (final skill in userResponse.currentCourse.skills) {
  ///    if (skill.isAccessible) {
  ///       print(skill.name);
  ///       print(skill.proficiency);
  ///       print(skill.tipsAndNotes);
  ///    }
  ///  }
  ///
  ///  // Delete cache.
  ///  duolingo.cleanCachedUser();
  ///}
  ///```
  Future<UserResponse> cachedUser({
    required String userId,
  });

  /// Returns cached all learned words associated with the language that
  /// the authenticated user is currently learning.
  ///
  /// The first call to this [cachedOverview] method will always result in a communication with the Duolingo API
  /// because there is no cached [OverviewResponse]. In the second and subsequent method calls, the cached [OverviewResponse]
  /// from the first method call will be returned.
  ///
  /// The type and data structure of the response is consistent with the [overview] method. However, please note that
  /// the cached data is returned from this method, so unless you explicitly delete this cached object data,
  /// the cached response object will always be returned.
  ///
  /// To delete the explicitly cached [OverviewResponse], call the [cleanCachedOverview] method.
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final authResponse = await duolingo.authenticate(
  ///    username: 'test_username',
  ///    password: 'test_password',
  ///  );
  ///
  ///  final overviewResponse = await duolingo.cachedOverview();
  ///
  ///  for (final vocabulary in overviewResponse.vocabularies) {
  ///      print(vocabulary.word);
  ///
  ///  // Delete cache.
  ///  duolingo.cleanCachedOverview();
  ///}
  ///```
  Future<OverviewResponse> cachedOverview();

  /// Returns cached hint information of [sentence] specified in the argument.
  ///
  /// For [fromLanguage], specify the language of the hint information,
  /// and for [learningLanguage], specify the language of the word
  /// or sentence specified in [sentence].
  ///
  /// The first call to this [cachedWordHint] method will always result in a communication with the Duolingo API
  /// because there is no cached [WordHintResponse]. In the second and subsequent method calls, the cached [WordHintResponse]
  /// from the first method call will be returned.
  ///
  /// The type and data structure of the response is consistent with the [wordHint] method. However, please note that
  /// the cached data is returned from this method, so unless you explicitly delete this cached object data,
  /// the cached response object will always be returned.
  ///
  /// To delete the explicitly cached [WordHintResponse], call the [cleanCachedWordHint] method.
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final wordHintResponse = await duolingo.cachedWordHint(
  ///    fromLanguage: 'en',
  ///    learningLanguage: 'es',
  ///    sentence: 'boligrafos',
  ///  );
  ///
  ///  for (final token in wordHintResponse.tokens) {
  ///    final headers = token.table.headers;
  ///    for (final header in headers) {
  ///      print(header.selected);
  ///      print(header.token);
  ///    }
  ///
  ///    final rows = token.table.rows;
  ///    for (final row in rows) {
  ///      for (final cell in row.cells) {
  ///        print(cell.hint);
  ///      }
  ///    }
  ///  }
  ///
  ///  // Delete cache.
  ///  duolingo.cleanCachedWordHint();
  ///}
  ///```
  Future<WordHintResponse> cachedWordHint({
    required String fromLanguage,
    required String learningLanguage,
    required String sentence,
  });

  /// Returns cached leaderboard information of the authenticated user.
  ///
  /// The first call to this [cachedLeaderboard] method will always result in a communication with the Duolingo API
  /// because there is no cached [LeaderboardResponse]. In the second and subsequent method calls, the cached [LeaderboardResponse]
  /// from the first method call will be returned.
  ///
  /// The type and data structure of the response is consistent with the [leaderboard] method. However, please note that
  /// the cached data is returned from this method, so unless you explicitly delete this cached object data,
  /// the cached response object will always be returned.
  ///
  /// To delete the explicitly cached [LeaderboardResponse], call the [cleanCachedLeaderboard] method.
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final authResponse = await duolingo.authenticate(
  ///    username: 'test_username',
  ///    password: 'test_password',
  ///  );
  ///
  ///  final leaderboardResponse = await duolingo.cachedLeaderboard();
  ///
  ///  print(leaderboardResponse.ranking);
  ///  print(leaderboardResponse.userIds);
  ///
  ///  final ranking = leaderboardResponse.ranking;
  ///
  ///  // You can order ranking by score item.
  ///  print(ranking.orderByScoreNameDesc());
  ///  print(ranking.orderByScoreXpDesc());
  ///
  ///  for (final score in ranking.scores) {
  ///    print(score.userId);
  ///    print(score.xp);
  ///  }
  ///
  ///  // Delete cache.
  ///  duolingo.cleanCachedLeaderboard();
  ///}
  ///```
  Future<LeaderboardResponse> cachedLeaderboard();

  /// Deletes all cached response objects.
  void cleanCache();

  /// Deletes the cached data of the response object that was cached by calling the [cachedVersionInfo] method.
  void cleanCachedVersionInfo();

  /// Deletes the cached data of the response object that was cached by calling the [cachedUser] method.
  void cleanCachedUser();

  /// Deletes the cached data of the response object that was cached by calling the [cachedOverview] method.
  void cleanCachedOverview();

  /// Deletes the cached data of the response object that was cached by calling the [cachedWordHint] method.
  void cleanCachedWordHint();

  /// Deletes the cached data of the response object that was cached by calling the [cachedLeaderboard] method.
  void cleanCachedLeaderboard();
}
