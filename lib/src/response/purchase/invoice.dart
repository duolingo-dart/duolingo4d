// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Invoice {
  /// Returns the new instance of [Invoice] based on arguments.
  Invoice.from({
    required this.id,
    required this.itemId,
    required this.itemName,
    required this.price,
    required this.quantity,
    required this.purchasedAt,
  });

  /// The id
  final String id;

  /// The item id
  final String itemId;

  /// The item name
  final String itemName;

  /// The price
  final int price;

  /// The quantity
  final int quantity;

  /// The purchased datetime
  final DateTime purchasedAt;

  @override
  String toString() {
    return 'Invoice(id: $id, itemId: $itemId, itemName: $itemName, price: $price, quantity: $quantity, purchasedAt: $purchasedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Invoice &&
        other.id == id &&
        other.itemId == itemId &&
        other.itemName == itemName &&
        other.price == price &&
        other.quantity == quantity &&
        other.purchasedAt == purchasedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        itemId.hashCode ^
        itemName.hashCode ^
        price.hashCode ^
        quantity.hashCode ^
        purchasedAt.hashCode;
  }
}
