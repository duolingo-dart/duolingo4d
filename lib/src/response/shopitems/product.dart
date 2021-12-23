// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Product {
  /// Returns the new instance of [Product] based on arguments.
  Product.from({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
  });

  /// The id
  final String id;

  /// The type
  final String type;

  /// The name
  final String name;

  /// The description
  final String description;

  /// The price
  final int price;

  /// The currency
  final String currency;

  @override
  String toString() {
    return 'Product(id: $id, type: $type, name: $name, description: $description, price: $price, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.type == type &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.currency == currency;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        currency.hashCode;
  }
}
