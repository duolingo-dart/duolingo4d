// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:duolingo4d/src/adapter/search_forum_adapter.dart';
import 'package:duolingo4d/src/response/searchforum/search_forum_response.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';

class SearchForumRequest extends Request<SearchForumResponse> {
  /// Returns the new instance of [SearchForumRequest] based on an argument.
  SearchForumRequest.from({
    required this.page,
    required this.perPage,
    required this.query,
  });

  /// The page
  final int page;

  /// The per page
  final int perPage;

  /// The query
  final String query;

  /// The response adapter
  static final _adapter = SearchForumAdapter.newInstance();

  @override
  Future<SearchForumResponse> send() async => _adapter.convert(
        response: await http.get(
          Uri.parse(
              '${Endpoint.forum.url}/${Resource.searchForum.url}?q=$query&page=$page&limit=$perPage'),
          headers: InternalSession.instance.headers,
        ),
      );
}
