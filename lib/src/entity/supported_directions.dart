// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class SupportedDirection {
  /// Returns the new instance of [SupportedDirection] based on arguments.
  SupportedDirection.from({
    required this.fromLanguage,
    required this.learningLanguages,
  });

  /// The from language
  final String fromLanguage;

  /// The learning languages linked to [fromLanguage].
  final List<String> learningLanguages;
}
