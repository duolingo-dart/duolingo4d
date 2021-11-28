// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Flutter imports:
import 'package:duolingo4d/src/adapter/adapter.dart';

// Project imports:
import 'package:duolingo4d/src/http_status.dart';
import 'package:http/http.dart';

class SwitchLanguageApiAdapter extends Adapter {
  @override
  Future<void> execute({
    required Response response,
  }) async {
    try {
      final httpStatus = HttpStatus.from(code: response.statusCode);

      if (httpStatus.isAccepted) {}
    } catch (e) {}
  }
}
