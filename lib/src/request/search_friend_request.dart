// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/search_friend_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/searchfriend/search_friend_response.dart';

class SearchFriendRequest extends Request<SearchFriendResponse> {
  /// Returns the new instance of [SearchFriendRequest] based on arguments.
  SearchFriendRequest.from({
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
  static final _adapter = SearchFriendAdapter.newInstance();

  @override
  Future<SearchFriendResponse> send() async => _adapter.convert(
        response: await http.post(
          Uri.parse('${Endpoint.base.url}/${Resource.searchFriend.url}'),
          headers: InternalSession.instance.headers,
          body: {
            'page': '$page',
            'per_page': '$perPage',
            'q': query,
          },
        ),
      );
}
