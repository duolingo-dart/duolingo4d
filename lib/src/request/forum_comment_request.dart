// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/forum_comment_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/forum/comment/forum_comment_response.dart';

class ForumCommentRequest extends Request<ForumCommentResponse> {
  /// Returns the new instance of [ForumCommentRequest] based on an argument.
  ForumCommentRequest.from({
    required this.commentId,
  });

  /// The response adapter
  static final _adapter = ForumCommentAdapter.newInstance();

  /// The comment id
  final int commentId;

  @override
  Future<ForumCommentResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse(
            '${Endpoint.forum.url}/${Resource.forumComment.url}/$commentId',
          ),
          headers: InternalSession.instance.headers,
        ),
      );
}
