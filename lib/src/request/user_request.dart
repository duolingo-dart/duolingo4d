// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/session.dart';

class UserRequest extends Request {
  /// The internal constructor for singleton.
  UserRequest._internal();

  /// Returns the singleton instance of [UserRequest].
  factory UserRequest.getInstance() => _singletonInstance;

  /// The required parameter for user id
  static const _paramUserId = 'userId';

  /// The session
  static final _session = Session.getInstance();

  /// The singleton instance of [UserRequest].
  static final _singletonInstance = UserRequest._internal();

  @override
  Future<http.Response> send({
    final params = const <String, String>{},
  }) async {
    return await http.get(
      Uri.parse('${DuolingoApi.user.url}/${params[_paramUserId]}'),
      headers: _session.headers,
    );
  }
}
