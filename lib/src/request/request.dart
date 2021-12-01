// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/src/response/response.dart';

/// The class that represents http request.
abstract class Request<R extends Response> {
  Future<R> send();
}
