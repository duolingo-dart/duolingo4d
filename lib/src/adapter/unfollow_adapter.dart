// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:duolingo4d/src/response/subscriptions/unfollow_response.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';

class UnfollowAdapter extends Adapter<UnfollowResponse> {
  /// Returns the new instance of [FollowAdapter].
  UnfollowAdapter.newInstance();

  @override
  UnfollowResponse convert({
    required Response response,
  }) =>
      UnfollowResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
      );
}
