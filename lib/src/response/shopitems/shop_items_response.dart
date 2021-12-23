// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart';

import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/shopitems/product.dart';
import 'package:duolingo4d/src/response/status.dart';

export 'package:duolingo4d/src/response/shopitems/product.dart';

class ShopItemsResponse extends Response {
  /// Returns the new instance of [ShopItemsResponse] based on arguments.
  ShopItemsResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.products,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The products
  final List<Product> products;

  @override
  String toString() => 'ShopItemsResponse(products: $products)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ShopItemsResponse && listEquals(other.products, products);
  }

  @override
  int get hashCode => products.hashCode;
}
