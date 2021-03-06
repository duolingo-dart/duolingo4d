// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

/// This class represents the response entity for the Switch Language API in the Duolingo API.
///
/// Since there are currently no responses specific to this API,
/// only the common HTTP response status and HTTP headers can be referenced.
class SwitchLanguageResponse extends Response {
  /// Returns the new instance of [SwitchLanguageResponse] based on arguments.
  SwitchLanguageResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );
}
