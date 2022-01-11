// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:duolingo4d/src/adapter/purchase_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/purchase/purchase_response.dart';

class PurchaseRequest extends Request<PurchaseResponse> {
  /// Returns the new instance of [PurchaseRequest] based on arguments.
  PurchaseRequest.from({
    required this.itemId,
    required this.userId,
    required this.learningLanguage,
  });

  /// The item id
  final String itemId;

  /// The user id
  final String userId;

  /// The learning language
  final String learningLanguage;

  /// The response adapter
  static final _adapter = PurchaseAdapter.newInstance();

  @override
  Future<PurchaseResponse> send() async => _adapter.convert(
        response: await http.post(
          Uri.parse(
              '${Endpoint.base.url}/${Resource.purchase.url}/$userId/shop-items'),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          }..addAll(InternalSession.instance.headers),
          body: json.encode(
            {
              'itemName': itemId,
              'learningLanguage': learningLanguage,
            },
          ),
        ),
      );
}
