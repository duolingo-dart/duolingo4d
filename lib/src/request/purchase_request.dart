// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/src/adapter/purchase_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/shopitems/purchase_response.dart';
import 'package:http/http.dart' as http;

class PurchaseRequest extends Request<PurchaseResponse> {
  /// Returns the new instance of [PurchaseRequest] based on arguments.
  PurchaseRequest.from({
    required this.itemId,
    required this.learningLanguage,
  });

  /// The item id
  final String itemId;

  /// The learning language
  final String learningLanguage;

  /// The response adapter
  static final _adapter = PurchaseAdapter.newInstance();

  /// The API uri
  static final _apiUri =
      Uri.parse('${Endpoint.base.url}/${Resource.shopItems.url}');

  @override
  Future<PurchaseResponse> send() async => _adapter.convert(
        response: InternalSession.instance.refreshRequestHeader(
          response: await http.post(
            _apiUri,
            body: {
              'itemName': itemId,
              'learningLanguage': learningLanguage,
            },
          ),
        ),
      );
}
