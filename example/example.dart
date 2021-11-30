// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/duolingo4d.dart';

class DemoDuolingo4D {
  Future<void> main() async {
    final api = DuolingoApi.getInstance();

    // It does not need authentication.
    // You can fetch metadata about the configuration of Duolingo.
    // ignore: unused_local_variable
    final versionInfo = await api.fetchVersionInfo();

    // You can login with this api.
    // You can use registered email address as a username.
    final authenticationResult = await api.login(
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
  }
}
