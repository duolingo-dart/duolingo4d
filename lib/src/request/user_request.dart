// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/user_api_adapter.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/response/user/user.dart';
import 'package:duolingo4d/src/session.dart';

class UserRequest extends Request<UserResponse> {
  /// Returns the new instance of [UserRequest] based on an argument.
  UserRequest.from({
    required this.userId,
  });

  /// The user id
  final String userId;

  /// The session
  static final _session = Session.getInstance();

  @override
  Future<UserResponse> send() async => UserApiAdapter().execute(
        response: await http.get(
          Uri.parse(
            'https://www.duolingo.com/2017-06-30/users/$userId',
          ),
          headers: _session.headers,
        ),
      );
}
