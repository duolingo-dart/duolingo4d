// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:duolingo4d/src/adapter/forum_comments_adapter.dart';
import 'package:duolingo4d/src/const/forum_comments_sort_pattern.dart';
import 'package:duolingo4d/src/response/forum/comments/forum_comments_response.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';

class ForumCommentsRequest extends Request<ForumCommentsResponse> {
  /// Returns the new instance of [ForumCommentsRequest] based on an argument.
  ForumCommentsRequest.from({
    required this.page,
    required this.sortPattern,
    required this.topicId,
  });

  /// The response adapter
  static final _adapter = ForumCommentsAdapter.newInstance();

  /// The page
  final int page;

  /// The sort pattern
  final ForumCommentsSortPattern sortPattern;

  /// The topic id
  final int topicId;

  @override
  Future<ForumCommentsResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse(
            '${Endpoint.forum.url}/${Resource.forumComments.url}?page=$page&sort_by=${sortPattern.queryValue}&topic_id=${topicId != -1 ? topicId : 'null'}',
          ),
          headers: InternalSession.instance.headers,
        ),
      );
}
