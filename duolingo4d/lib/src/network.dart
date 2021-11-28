// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Dart imports:
import 'dart:io';

class Network {
  /// The base host to check a network connection
  static const _baseHost = 'www.duolingo.com';

  static Future<bool> isConnected() async {
    try {
      final connection = await InternetAddress.lookup(_baseHost);
      return connection.isNotEmpty && connection[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
