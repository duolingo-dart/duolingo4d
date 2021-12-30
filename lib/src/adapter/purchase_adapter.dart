// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:http/http.dart';
import 'package:json_response/json_response.dart';

// Project imports:
import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/purchase/purchase_response.dart';

class PurchaseAdapter extends Adapter<PurchaseResponse> {
  /// Returns the new instance of [AuthAdapter].
  PurchaseAdapter.newInstance();

  @override
  PurchaseResponse convert({
    required Response response,
  }) =>
      _buildPurchaseResponse(
        response: response,
        json: super.jsonDecode(response: response),
      );
}

/// Returns [PurchaseResponse] based on [response] and [json].
PurchaseResponse _buildPurchaseResponse({
  required Response response,
  required Json json,
}) =>
    PurchaseResponse.from(
      statusCode: response.statusCode,
      reasonPhrase: response.reasonPhrase ?? '',
      headers: response.headers,
      invoice: _buildInvoice(json: json),
    );

Invoice? _buildInvoice({required Json json}) {
  if (json.isEmpty) {
    return null;
  }

  return Invoice.from(
    id: json.getString(key: 'purchaseId'),
    itemId: json.getString(key: 'id'),
    itemName: json.getString(key: 'itemName'),
    price: json.getInt(key: 'purchasePrice'),
    quantity: json.getInt(key: 'quantity'),
    purchasedAt: DateTime.fromMillisecondsSinceEpoch(
      json.getInt(key: 'purchaseDate') * 1000,
    ),
  );
}
