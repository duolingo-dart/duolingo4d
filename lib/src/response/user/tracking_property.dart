// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart';

/// This class represents the user's tracking property.
///
/// This class contains basic information about the user registered with Duolingo,
/// as well as information such as whether and how many items the user currently owns.
class TrackingProperty {
  /// Returns the new instance of [TrackingProperty] based on arguments.
  TrackingProperty.from({
    required this.userId,
    required this.username,
    required this.learningLanguage,
    required this.learningReason,
    required this.uiLanguage,
    required this.level,
    required this.followers,
    required this.following,
    required this.lingots,
    required this.gems,
    required this.goalXp,
    required this.streak,
    required this.hasFullname,
    required this.hasItemStreakFreeze,
    required this.hasItemStreakRepair,
    required this.hasItemStreakWager,
    required this.hasItemWeekendAmulet,
    required this.hasItemRupeeWager,
    required this.hasItemPremiumSubscription,
    required this.hasItemLiveSubscription,
    required this.hasItemImmersiveSubscription,
    required this.hasPicture,
    required this.hasPhoneNumber,
    required this.isAgeRestricted,
    required this.isTrialAccount,
    required this.numberStreakFreeze,
    required this.numberUnlockedSection,
    required this.numberCompletedSession,
    required this.numberUnlockedSkill,
    required this.numberClassroom,
    required this.numberObservee,
    required this.achievements,
  });

  /// The user id
  final String userId;

  /// The user name
  final String username;

  /// The learning language
  final String learningLanguage;

  /// The learning reason
  final String learningReason;

  /// The ui language
  final String uiLanguage;

  /// The level
  final int level;

  /// The count of follower
  final int followers;

  /// The count of following
  final int following;

  /// The lingots
  final int lingots;

  /// The gems
  final int gems;

  /// The goal xp
  final int goalXp;

  /// The streak
  final int streak;

  /// The flag that represents user has fullname or not
  final bool hasFullname;

  /// The flag that represents user has streak freeze or not
  final bool hasItemStreakFreeze;

  /// The flag that represents user has streak repair or not
  final bool hasItemStreakRepair;

  /// The flag that represents user has streak wager or not
  final bool hasItemStreakWager;

  /// The flag that represents user has weekend amulet or not
  final bool hasItemWeekendAmulet;

  /// The flag that represents user has rupee wager or not
  final bool hasItemRupeeWager;

  /// The flag that represents user has premium subscription or not
  final bool hasItemPremiumSubscription;

  /// The flag that represents user has live subscription or not
  final bool hasItemLiveSubscription;

  /// The flag that represents user has immersive subscription or not
  final bool hasItemImmersiveSubscription;

  /// The flag that represents user has a picture or not
  final bool hasPicture;

  /// The flag that represents user has a phone number or not
  final bool hasPhoneNumber;

  /// The flag that represents user is age　restricted or not
  final bool isAgeRestricted;

  /// The flag that represents user is trial account or not
  final bool isTrialAccount;

  /// The number of streak freeze
  final int numberStreakFreeze;

  /// The number of unlocked section
  final int numberUnlockedSection;

  /// The number of completed session
  final int numberCompletedSession;

  /// The number of unlocked skill
  final int numberUnlockedSkill;

  /// The number of classroom
  final int numberClassroom;

  /// The number of observee
  final int numberObservee;

  /// The achivements
  final List<String> achievements;

  @override
  String toString() {
    return 'TrackingProperty(userId: $userId, username: $username, learningLanguage: $learningLanguage, learningReason: $learningReason, uiLanguage: $uiLanguage, level: $level, followers: $followers, following: $following, lingots: $lingots, gems: $gems, goalXp: $goalXp, streak: $streak, hasFullname: $hasFullname, hasItemStreakFreeze: $hasItemStreakFreeze, hasItemStreakRepair: $hasItemStreakRepair, hasItemStreakWager: $hasItemStreakWager, hasItemWeekendAmulet: $hasItemWeekendAmulet, hasItemRupeeWager: $hasItemRupeeWager, hasItemPremiumSubscription: $hasItemPremiumSubscription, hasItemLiveSubscription: $hasItemLiveSubscription, hasItemImmersiveSubscription: $hasItemImmersiveSubscription, hasPicture: $hasPicture, hasPhoneNumber: $hasPhoneNumber, isAgeRestricted: $isAgeRestricted, isTrialAccount: $isTrialAccount, numberStreakFreeze: $numberStreakFreeze, numberUnlockedSection: $numberUnlockedSection, numberCompletedSession: $numberCompletedSession, numberUnlockedSkill: $numberUnlockedSkill, numberClassroom: $numberClassroom, numberObservee: $numberObservee, achievements: $achievements)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is TrackingProperty &&
        other.userId == userId &&
        other.username == username &&
        other.learningLanguage == learningLanguage &&
        other.learningReason == learningReason &&
        other.uiLanguage == uiLanguage &&
        other.level == level &&
        other.followers == followers &&
        other.following == following &&
        other.lingots == lingots &&
        other.gems == gems &&
        other.goalXp == goalXp &&
        other.streak == streak &&
        other.hasFullname == hasFullname &&
        other.hasItemStreakFreeze == hasItemStreakFreeze &&
        other.hasItemStreakRepair == hasItemStreakRepair &&
        other.hasItemStreakWager == hasItemStreakWager &&
        other.hasItemWeekendAmulet == hasItemWeekendAmulet &&
        other.hasItemRupeeWager == hasItemRupeeWager &&
        other.hasItemPremiumSubscription == hasItemPremiumSubscription &&
        other.hasItemLiveSubscription == hasItemLiveSubscription &&
        other.hasItemImmersiveSubscription == hasItemImmersiveSubscription &&
        other.hasPicture == hasPicture &&
        other.hasPhoneNumber == hasPhoneNumber &&
        other.isAgeRestricted == isAgeRestricted &&
        other.isTrialAccount == isTrialAccount &&
        other.numberStreakFreeze == numberStreakFreeze &&
        other.numberUnlockedSection == numberUnlockedSection &&
        other.numberCompletedSession == numberCompletedSession &&
        other.numberUnlockedSkill == numberUnlockedSkill &&
        other.numberClassroom == numberClassroom &&
        other.numberObservee == numberObservee &&
        listEquals(other.achievements, achievements);
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        username.hashCode ^
        learningLanguage.hashCode ^
        learningReason.hashCode ^
        uiLanguage.hashCode ^
        level.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        lingots.hashCode ^
        gems.hashCode ^
        goalXp.hashCode ^
        streak.hashCode ^
        hasFullname.hashCode ^
        hasItemStreakFreeze.hashCode ^
        hasItemStreakRepair.hashCode ^
        hasItemStreakWager.hashCode ^
        hasItemWeekendAmulet.hashCode ^
        hasItemRupeeWager.hashCode ^
        hasItemPremiumSubscription.hashCode ^
        hasItemLiveSubscription.hashCode ^
        hasItemImmersiveSubscription.hashCode ^
        hasPicture.hashCode ^
        hasPhoneNumber.hashCode ^
        isAgeRestricted.hashCode ^
        isTrialAccount.hashCode ^
        numberStreakFreeze.hashCode ^
        numberUnlockedSection.hashCode ^
        numberCompletedSession.hashCode ^
        numberUnlockedSkill.hashCode ^
        numberClassroom.hashCode ^
        numberObservee.hashCode ^
        achievements.hashCode;
  }
}
