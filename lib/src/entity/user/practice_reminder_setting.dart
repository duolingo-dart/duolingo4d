// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class PracticeReminderSetting {
  /// Returns the new instance of [PracticeReminderSetting] based on arguments.
  PracticeReminderSetting.from({
    required this.learningLanguage,
    required this.timeInMinutes,
    required this.pushEnabled,
    required this.useSmartReminderTime,
    required this.emailEnabled,
  });

  /// The learning language
  final String learningLanguage;

  /// The time in minutes
  final int timeInMinutes;

  /// The flag that represents push is enabled or not
  final bool pushEnabled;

  /// The flag that represents use smart reminder time or not
  final bool useSmartReminderTime;

  /// The flag that represents email is enabled or not
  final bool emailEnabled;
}
