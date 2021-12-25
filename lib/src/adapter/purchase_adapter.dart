// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/src/adapter/adapter.dart';
import 'package:duolingo4d/src/response/shopitems/purchase_response.dart';
import 'package:http/http.dart';
import 'package:json_pro/json_pro.dart';

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

  /// Returns [PurchaseResponse] based on [response] and [json].
  PurchaseResponse _buildPurchaseResponse({
    required Response response,
    required Json json,
  }) =>
      PurchaseResponse.from(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase ?? '',
        headers: response.headers,
      );
}
