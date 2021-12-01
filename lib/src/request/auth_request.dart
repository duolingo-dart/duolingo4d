// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/auth_api_adapter.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/response/auth/auth_response.dart';
import 'package:duolingo4d/src/session.dart';

/// This class provides the function to send a request for user authentication.
class AuthRequest extends Request<AuthResponse> {
  /// Returns the new instance of [AuthRequest] based on arguments.
  AuthRequest.from({
    required this.username,
    required this.password,
  });

  /// The password
  final String password;

  /// The username
  final String username;

  /// The response adapter
  static final _adapter = AuthApiAdapter.newInstance();

  /// The API uri
  static final _apiUri = Uri.parse('https://www.duolingo.com/login');

  /// The session
  static final _session = Session.getInstance();

  @override
  Future<AuthResponse> send() async => _adapter.convert(
        response: _session.refreshCookie(
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
