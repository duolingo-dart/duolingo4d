// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:http/http.dart' as http;

/// The class that represents http request.
abstract class Request {
  Future<http.Response> send({Map<String, String> params});

  void checkParameterKey({
    required Map<String, String> params,
    required String name,
  }) {
    if (!params.containsKey(name)) {
      throw FlutterError('The parameter key "$name" is required.');
    }
  }
}
