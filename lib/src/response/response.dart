// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This abstract class represents the common elements
/// of the entity objects corresponding to the Duolingo API.
///
/// This abstract class manages the following information.
/// 1. [statusCode]     ->  HTTP status code included in the response returned by the API.
/// 2. [reasonPhrase]   ->  Message included in the response returned by the API.
/// 3. [headers]        ->  Headers included in the response returned by the API.
///
/// If you want to check the HTTP status and header information of the response
/// after calling a method of `Duolingo4D`, you can refer to the entity object
/// that inherits from this abstract class.
///
/// **_Example:_**
///
/// ```dart
/// void main() async {
///   final duolingo = Duolingo.getInstance();
///
///   final authResponse = await duolingo.authenticate(
///     username: 'test_username',
///     password: 'test_password',
///   );
///
///   if (authResponse.statusCode != 200) {
///     authResponse.reasonPhrase;
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
abstract class Response {
  /// Returns the new instance of [Response] based on arguments.
  Response.from({
    required this.statusCode,
    required this.reasonPhrase,
    required this.headers,
  });

  /// The status code of response
  final int statusCode;

  /// The reason phrase about status code
  final String reasonPhrase;

  /// The response headers
  final Map<String, String> headers;
}
