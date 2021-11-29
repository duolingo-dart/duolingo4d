// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:duolingo4d/src/adapter/login_api_adapter.dart';
import 'package:duolingo4d/src/entity/login/authentication_result_entity.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/session.dart';

class LoginRequest extends Request<AuthenticationResultEntity> {
  /// Returns the new instance of [LoginRequest] based on arguments.
  LoginRequest.from({
    required this.username,
    required this.password,
  });

  /// The password
  final String password;

  /// The username
  final String username;

  /// The API uri
  static final _apiUri = Uri.parse(DuolingoApi.login.url);

  /// The session
  static final _session = Session.getInstance();

  @override
  Future<AuthenticationResultEntity> send({
    final params = const <String, String>{},
  }) async =>
      LoginApiAdapter().execute(
        response: _session.updateCookie(
          response: await http.post(
            _apiUri,
            body: {
              'login': username,
              'password': password,
            },
          ),
        ),
      );
}
