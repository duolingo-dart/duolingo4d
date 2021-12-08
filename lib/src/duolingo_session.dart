// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/duolingo_request_header.dart';

/// This class represents the session information when communicating with the Duolingo API.
class DuolingoSession {
  /// Returns the new instance of [DuolingoSession] based on an argument.
  DuolingoSession.from({
    required this.requestHeader,
  });

  /// The request header
  final DuolingoRequestHeader requestHeader;

  @override
  String toString() => 'DuolingoSession(requestHeader: $requestHeader)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DuolingoSession && other.requestHeader == requestHeader;
  }

  @override
  int get hashCode => requestHeader.hashCode;
}
