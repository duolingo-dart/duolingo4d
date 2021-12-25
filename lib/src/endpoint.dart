// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

enum Endpoint {
  /// Base
  base,

  /// Dictionary
  dictionary,
}

extension EndpointFeature on Endpoint {
  String get url {
    switch (this) {
      case Endpoint.base:
        return 'https://www.duolingo.com';
      case Endpoint.dictionary:
        return 'https://d2.duolingo.com';
    }
  }
}
