// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/duolingo4d.dart';

class DemoDuolingo4D {
  Future<void> main() async {
    // Get the singleton instance.
    final api = Duolingo.getInstance();

    //! ---------- ↓ Authentication Does Not Required ↓ ----------

    // You can fetch metadata about the configuration of Duolingo.
    // ignore: unused_local_variable
    final versionInfo = await api.fetchVersionInfo();

    // You can login with this api.
    // You can use registered email address as a username.
    final authenticationResult = await api.authenticate(
      username: 'test_user',
      password: 'test_password',
    );

    if (authenticationResult.statusCode != 200) {
      // Client or Server error or something.
      authenticationResult.reasonPhrase;
      authenticationResult.headers;
      return;
    }

    if (authenticationResult.hasError) {
      // When there is an error on authentication.
      final authenticationError = authenticationResult.error!;
      authenticationError.code;
      authenticationError.reason;
      authenticationError.isInvalidUser; // Returns true if user is invalid.
      authenticationError
          .isInvalidPassword; // Returns true if password is invalid.
      return;
    }

    // You can fetch hint of word.
    // It is possible to specify not only words but also sentences in bulk.
    // ignore: unused_local_variable
    final wordHint = await api.fetchWordHint(
      fromLanguage: 'en',
      learningLanguage: 'es',
      sentence: 'boligrafos',
    );

    for (final token in wordHint.tokens) {
      final headers = token.table.headers;
      for (final header in headers) {
        // ignore: avoid_print
        print(header.token);
      }

      final rows = token.table.rows;
      for (final row in rows) {
        for (final cell in row.cells) {
          // ignore: avoid_print
          print(cell.hint);
        }
      }
    }

    //! ---------- ↑ Authentication Does Not Required ↑ ----------

    //! -------------- ↓ Authentication Required ↓ --------------

    // You can fetch user information based on user id.
    // ignore: unused_local_variable
    final user = await api.fetchUser(userId: authenticationResult.userId);

    // You can fetch all vocabularies you learned in Duolingo.
    // ignore: unused_local_variable
    final overview = await api.fetchOverview();

    for (final vocabulary in overview.vocabularies) {
      // ignore: avoid_print
      print(vocabulary.word);
    }

    final response = await api.switchLanguage(
      fromLanguage: 'es',
      learningLanguage: 'en',
    );

    // ignore: avoid_print
    print(response.statusCode);
    // ignore: avoid_print
    print(response.reasonPhrase);

    //! -------------- ↑ Authentication Required ↑ --------------
  }
}
