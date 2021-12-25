// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/shopitems/shop_items_response.dart';

class ShopItemsAdapter extends Adapter<ShopItemsResponse> {
  /// Returns the new instance of [ShopItemsAdapter].
  ShopItemsAdapter.newInstance();

  @override
  ShopItemsResponse convert({
    required Response response,
  }) =>
      _buildShopItemsResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );

  ShopItemsResponse _buildShopItemsResponse({
    required Response response,
    required JsonResponse json,
  }) =>
      ShopItemsResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
        products: _buildProducts(
          jsonList: json.getJsonList(key: 'shopItems'),
        ),
      );

  List<Product> _buildProducts({
    required List<JsonResponse> jsonList,
  }) {
    final products = <Product>[];
    for (final json in jsonList) {
      products.add(
        Product.from(
          id: json.getString(key: 'id'),
          type: json.getString(key: 'type'),
          name: json.getString(key: 'name'),
          description: json.getString(key: 'localizedDescription'),
          price: json.getInt(key: 'price'),
          currency: json.getString(key: 'currencyType'),
        ),
      );
    }

    return products;
  }
}
