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
    username: 'yourdream28@gmail.com',
    password: 'pierrot19930924ks',
  );

  final suscribersResponse = await duolingo.subscribers(
    userId: authResponse.userId,
  );

  print(suscribersResponse);

  for (final follower in suscribersResponse.followers) {
    print(follower);
  }
}
