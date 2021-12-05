// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents a setting for reminding user to learn.
class PracticeReminderSetting {
  /// Returns the new instance of [PracticeReminderSetting] based on arguments.
  PracticeReminderSetting.from({
    required this.learningLanguage,
    required this.timeInMinutes,
    required this.isEnabledPush,
    required this.useSmartReminderTime,
    required this.isEnabledEmail,
  });

  /// The learning language
  final String learningLanguage;

  /// The time in minutes
  final int timeInMinutes;

  /// The flag that represents push is enabled or not
  final bool isEnabledPush;

  /// The flag that represents use smart reminder time or not
  final bool useSmartReminderTime;

  /// The flag that represents email is enabled or not
  final bool isEnabledEmail;

  @override
  String toString() {
    return 'PracticeReminderSetting(learningLanguage: $learningLanguage, timeInMinutes: $timeInMinutes, isEnabledPush: $isEnabledPush, useSmartReminderTime: $useSmartReminderTime, isEnabledEmail: $isEnabledEmail)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PracticeReminderSetting &&
        other.learningLanguage == learningLanguage &&
        other.timeInMinutes == timeInMinutes &&
        other.isEnabledPush == isEnabledPush &&
        other.useSmartReminderTime == useSmartReminderTime &&
        other.isEnabledEmail == isEnabledEmail;
  }

  @override
  int get hashCode {
    return learningLanguage.hashCode ^
        timeInMinutes.hashCode ^
        isEnabledPush.hashCode ^
        useSmartReminderTime.hashCode ^
        isEnabledEmail.hashCode;
  }
}
