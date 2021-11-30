// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:duolingo4d/duolingo4d.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('', () async {
    final a = DuolingoApi.getInstance();
    final b = DuolingoApi.getInstance();

    print(a == b);
  });
}
