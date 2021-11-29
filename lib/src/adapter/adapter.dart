// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:http/http.dart';

abstract class Adapter<R> {
  Future<R> execute({
    required Response response,
  });
}
