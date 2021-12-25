// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/response/purchase/invoice.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

export 'package:duolingo4d/src/response/purchase/invoice.dart';

class PurchaseResponse extends Response {
  /// Returns the new instance of [PurchaseResponse] based on arguments.
  PurchaseResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.invoice,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The invoice
  final Invoice? invoice;

  /// Returns true if purchase request was succeeded, otherwise false.
  bool get isEstablished => invoice != null;

  /// Returns true if purchase request was failed, otherwise false.
  bool get isNotEstablished => !isEstablished;

  @override
  String toString() => 'PurchaseResponse(invoice: $invoice)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PurchaseResponse && other.invoice == invoice;
  }

  @override
  int get hashCode => invoice.hashCode;
}
