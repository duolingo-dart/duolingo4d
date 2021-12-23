// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/src/adapter/shop_items_adapter.dart';
import 'package:duolingo4d/src/duolingo_api.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/response/shopitems/shop_items_response.dart';
import 'package:http/http.dart' as http;

class ShopItemsRequest extends Request<ShopItemsResponse> {
  /// Returns the new instance of [ShopItemsRequest].
  ShopItemsRequest.newInstance();

  /// The response adapter
  static final _adapter = ShopItemsAdapter.newInstance();

  /// The API uri
  static final _apiUri = Uri.parse(DuolingoApi.shopItems.url);

  @override
  Future<ShopItemsResponse> send() async => _adapter.convert(
        response: await http.get(
          _apiUri,
          headers: InternalSession.instance.headers,
        ),
      );
}
