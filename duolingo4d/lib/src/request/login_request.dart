// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/session.dart';

class LoginRequest extends Request {
  /// The internal constructor for singleton.
  LoginRequest._internal();

  /// Returns the singleton instance of [LoginRequest].
  factory LoginRequest.getInstance() => _singletonInstance;

  /// The API uri
  static final _apiUri = Uri.parse(DuolingoApi.login.url);

  /// The required parameter for username
  static const _paramLogin = 'login';

  /// The required parameter for password
  static const _paramPassword = 'password';

  /// The session
  static final _session = Session.getInstance();

  /// The singleton instance of [_LoginRequest].
  static final _singletonInstance = LoginRequest._internal();

  @override
  Future<http.Response> send({
    final params = const <String, String>{},
  }) async {
    super.checkParameterKey(params: params, name: _paramLogin);
    super.checkParameterKey(params: params, name: _paramPassword);

    return _session.updateCookie(
      response: await http.post(
        _apiUri,
        body: {
          _paramLogin: '${params[_paramLogin]}',
          _paramPassword: '${params[_paramPassword]}',
        },
      ),
    );
  }
}
