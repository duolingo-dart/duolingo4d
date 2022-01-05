// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/forum_comments_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/forum/comments/forum_comments_response.dart';

class ForumCommentsRequest extends Request<ForumCommentsResponse> {
  /// Returns the new instance of [ForumCommentsRequest] based on an argument.
  ForumCommentsRequest.from({
    required this.commentId,
  });

  /// The response adapter
  static final _adapter = ForumCommentsAdapter.newInstance();

  /// The comment id
  final int commentId;

  @override
  Future<ForumCommentsResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse(
            '${Endpoint.forum.url}/${Resource.forumComments.url}/$commentId',
          ),
          headers: InternalSession.instance.headers,
        ),
      );
}
