// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:duolingo4d/src/response/subscriptions/follow_response.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';

class FollowAdapter extends Adapter<FollowResponse> {
  /// Returns the new instance of [FollowAdapter].
  FollowAdapter.newInstance();

  @override
  FollowResponse convert({
    required Response response,
  }) =>
      FollowResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
      );
}
