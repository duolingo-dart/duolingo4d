// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/response.dart';

/// This is an abstract class that provides the functionality to send requests
/// to the Duolingo API. Then convert the response returned from the Duolingo API
/// into an entity object corresponding to the respective API and returning it.
///
/// The response object returned from this abstract class always contains
/// the HTTP status code and header information in addition to the API-specific body data.
///
/// The generic of this abstract class should be the type
/// returned by the [send] method implemented in the concrete class
/// that inherits from this abstract class.
abstract class Request<R extends Response> {
  /// Sends a request to the Duolingo API.
  ///
  /// Also converts the response returned by the Duolingo API
  /// into an entity object corresponding to each Duolingo API
  /// and returns it.
  Future<R> send();
}
