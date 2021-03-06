// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/response/response.dart';

/// This is an abstract class that provides a function
/// to convert the response returned from HTTP communication
/// with the Duolingo API into an entity corresponding to each API.
///
/// The class that defines the process of converting the response
/// returned from the Duolingo API into a unique entity must inherit
/// from this abstract class and implement each abstract method.
///
/// The generic of this abstract class should be the type
/// returned by the [convert] method implemented in the concrete class
/// that inherits from this abstract class.
abstract class Adapter<R extends Response> {
  /// Converts the [response] given as an argument into an entity object
  /// corresponding to each Duolingo API and returns it.
  R convert({
    required http.Response response,
  });

  Json jsonDecode({
    required http.Response response,
  }) {
    if (response.statusCode != 200) {
      return Json.empty();
    }

    try {
      return Json.from(response: response);
    } on FormatException {
      return Json.empty();
    }
  }

  JsonArray jsonArrayDecode({
    required http.Response response,
  }) {
    if (response.statusCode != 200) {
      return JsonArray.empty();
    }

    try {
      return JsonArray.from(response: response);
    } on FormatException {
      return JsonArray.empty();
    }
  }
}
