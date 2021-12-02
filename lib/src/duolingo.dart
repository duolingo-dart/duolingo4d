// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/duolingo_impl.dart';
import 'package:duolingo4d/src/response/auth/auth_response.dart';
import 'package:duolingo4d/src/response/overview/overview_response.dart';
import 'package:duolingo4d/src/response/switchlanguage/switch_language_response.dart';
import 'package:duolingo4d/src/response/user/user_response.dart';
import 'package:duolingo4d/src/response/versioninfo/version_info_response.dart';
import 'package:duolingo4d/src/response/wordhint/word_hint_response.dart';

/// This class provides the features to access the Duolingo API easily.
abstract class Duolingo {
  /// Returns the singleton instance of [Duolingo].
  static get instance => DuolingoImpl.instance;

  /// Returns metadata about the configuration of the Duolingo service.
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
  ///  for (final voiceDirections in ttsVoiceConfiguration.voiceDirections) {
  ///    print(voiceDirections.language);
  ///    print(voiceDirections.voice);
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
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final wordHintResponse = await duolingo.wordHint(
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
}
