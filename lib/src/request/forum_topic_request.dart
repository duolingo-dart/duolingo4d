// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/forum_topic_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/forumtopic/forum_topic_response.dart';

class ForumTopicRequest extends Request<ForumTopicResponse> {
  /// Returns the new instance of [ForumTopicRequest] based on an argument.
  ForumTopicRequest.from({
    required this.topicId,
  });

  /// The response adapter
  static final _adapter = ForumTopicAdapter.newInstance();

  /// The topic id
  final int topicId;

  @override
  Future<ForumTopicResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse(
            '${Endpoint.forum.url}/${Resource.forumTopic.url}/$topicId',
          ),
          headers: InternalSession.instance.headers,
        ),
      );
}
