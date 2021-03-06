// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:duolingo4d/src/const/forum_comments_sort_pattern.dart';
import 'package:duolingo4d/src/const/illustration_format.dart';
import 'package:duolingo4d/src/duolingo_impl.dart';
import 'package:duolingo4d/src/duolingo_session.dart';
import 'package:duolingo4d/src/response/achievements/achievements_response.dart';
import 'package:duolingo4d/src/response/alphabets/alphabets_response.dart';
import 'package:duolingo4d/src/response/auth/auth_response.dart';
import 'package:duolingo4d/src/response/dictionary/dictionary_response.dart';
import 'package:duolingo4d/src/response/forum/comment/forum_comment_response.dart';
import 'package:duolingo4d/src/response/forum/comments/forum_comments_response.dart';
import 'package:duolingo4d/src/response/forum/topic/forum_topic_response.dart';
import 'package:duolingo4d/src/response/forum/topics/forum_topics_response.dart';
import 'package:duolingo4d/src/response/leaderboard/leaderboard_response.dart';
import 'package:duolingo4d/src/response/manifest/manifest_response.dart';
import 'package:duolingo4d/src/response/overview/overview_response.dart';
import 'package:duolingo4d/src/response/purchase/purchase_response.dart';
import 'package:duolingo4d/src/response/recommendations/recommendations_response.dart';
import 'package:duolingo4d/src/response/searchforum/search_forum_response.dart';
import 'package:duolingo4d/src/response/searchfriend/search_friend_response.dart';
import 'package:duolingo4d/src/response/shopitems/shop_items_response.dart';
import 'package:duolingo4d/src/response/stories/stories_response.dart';
import 'package:duolingo4d/src/response/subscribers/subscribers_response.dart';
import 'package:duolingo4d/src/response/subscriptions/follow_response.dart';
import 'package:duolingo4d/src/response/subscriptions/subscriptions_response.dart';
import 'package:duolingo4d/src/response/subscriptions/unfollow_response.dart';
import 'package:duolingo4d/src/response/switchlanguage/switch_language_response.dart';
import 'package:duolingo4d/src/response/user/user_response.dart';
import 'package:duolingo4d/src/response/versioninfo/version_info_response.dart';
import 'package:duolingo4d/src/response/wordhint/word_hint_response.dart';

/// This class provides the features to access the Duolingo API easily.
abstract class Duolingo {
  /// Returns the singleton instance of [Duolingo].
  static Duolingo get instance => DuolingoImpl.instance;

  /// Returns the session information when communicating with the Duolingo API.
  ///
  /// This session is created when the user is successfully authenticated by [authenticate],
  /// so if this [session] method is called before the user's authentication is completed,
  /// empty session information will be returned.
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() {
  ///  final session = Duolingo.instance.session;
  ///
  ///  // You can get request headers as map.
  ///  print(session.requestHeader.toMap());
  ///
  ///  // You can use cookie and authorization header.
  ///  print(session.requestHeader.cookie);
  ///  print(session.requestHeader.authHeader);
  ///}
  ///```
  DuolingoSession get session;

  Future<ManifestResponse> manifest();

  /// Returns metadata about the configuration of the Duolingo service.
  ///
  /// A call to this method will always cause a communication process with the Duolingo API.
  /// If you want to reuse the cached response object, use [cachedVersionInfo].
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final versionInfoResponse = await duolingo.versionInfo();
  ///  final ttsVoiceConfiguration = versionInfoResponse.ttsVoiceConfiguration;
  ///
  ///  for (final voiceDirection in ttsVoiceConfiguration.voiceDirections) {
  ///    print(voiceDirection.language);
  ///    print(voiceDirection.voice);
  ///  }
  ///}
  ///```
  Future<VersionInfoResponse> versionInfo();

  /// Authenticate the user using the user information provided as an argument.
  ///
  /// The [username] argument should not only be a username,
  /// but also an email address that has already been authenticated by Duolingo.
  ///
  /// If a user who has already been authenticated tries to authenticate again,
  /// the API will return an invalid password error.
  ///
  /// When the user associated with [username] and [password] is authenticated,
  /// there is no need to call [cleanCache] or any other method to delete the cache
  /// when the user is authenticated. The cache information will be cleaned automatically.
  ///
  /// **_Example:_**
  ///
  /// ```dart
  /// void main() async {
  ///   final duolingo = Duolingo.instance;
  ///
  ///   final authResponse = await duolingo.authenticate(
  ///     username: 'test_username',
  ///     password: 'test_password',
  ///   );
  ///
  ///   if (authResponse.status.isNotOk) {
  ///     authResponse.status.reasonPhrase;
  ///     authResponse.headers;
  ///     return;
  ///   }
  ///
  ///   if (authResponse.hasError) {
  ///     final authError = authResponse.error!;
  ///     print(authError.code);
  ///     print(authError.reason);
  ///
  ///     authError.isInvalidUser;
  ///     authError.isInvalidPassword;
  ///     return;
  ///   }
  /// }
  /// ```
  Future<AuthResponse> authenticate({
    required String username,
    required String password,
  });

  /// Returns the authenticated user information from [userId].
  ///
  /// A call to this method will always cause a communication process with the Duolingo API.
  /// If you want to reuse the cached response object, use [cachedUser].
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final authResponse = await duolingo.authenticate(
  ///    username: 'test_username',
  ///    password: 'test_password',
  ///  );
  ///
  ///  final userResponse = await duolingo.user(userId: authResponse.userId);
  ///
  ///  print(userResponse.name);
  ///  print(userResponse.lingots);
  ///
  ///  for (final course in userResponse.courses) {
  ///    print(course.title);
  ///    print(course.xp);
  ///  }
  ///
  ///  // Skill information is stored in a hierarchical structure.
  ///  final skillBook = userResponse.currentCourse.skillBook;
  ///
  ///  for (final chapter in skillBook.chapters) {
  ///    for (final content in chapter.contents) {
  ///      if (content.isAccessible) {
  ///        print(content.name);
  ///        print(content.proficiency);
  ///        print(content.tipsAndNotes);
  ///      }
  ///    }
  ///  }
  ///
  ///  // If you don't like the nested structure,
  ///  // you can use the toFlat method to make the structure flat.
  ///  //
  ///  // If you use the toFlat method, all the skill information that
  ///  // exists in SkillBook will be returned as a new list.
  ///  for (final skill in skillBook.toFlat()) {
  ///    if (skill.isAccessible) {
  ///      print(skill.name);
  ///      print(skill.proficiency);
  ///      print(skill.tipsAndNotes);
  ///    }
  ///  }
  ///}
  ///```
  Future<UserResponse> user({
    String userId,
  });

  /// Returns all learned words associated with the language that
  /// the authenticated user is currently learning.
  ///
  /// A call to this method will always cause a communication process with the Duolingo API.
  /// If you want to reuse the cached response object, use [cachedOverview].
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final authResponse = await duolingo.authenticate(
  ///    username: 'test_username',
  ///    password: 'test_password',
  ///  );
  ///
  ///  final overviewResponse = await duolingo.overview();
  ///
  ///  for (final vocabulary in overviewResponse.vocabularies) {
  ///      print(vocabulary.word);
  ///  }
  ///}
  ///```
  Future<OverviewResponse> overview();

  /// Returns the hint information of [sentence] specified in the argument.
  ///
  /// For [fromLanguage], specify the language of the hint information,
  /// and for [learningLanguage], specify the language of the word
  /// or sentence specified in [sentence].
  ///
  /// A call to this method will always cause a communication process with the Duolingo API.
  /// If you want to reuse the cached response object, use [cachedWordHint].
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final authResponse = await duolingo.authenticate(
  ///    username: 'test_username',
  ///    password: 'test_password',
  ///  );
  ///
  ///  final wordHintResponse = await duolingo.wordHint(
  ///    fromLanguage: 'en',
  ///    learningLanguage: 'es',
  ///    sentence: 'bol??grafos',
  ///  );
  ///
  ///  for (final token in wordHintResponse.tokens) {
  ///    final headers = token.table.headers;
  ///    for (final header in headers) {
  ///      print(header.selected);
  ///      print(header.token);
  ///    }
  ///
  ///    final rows = token.table.rows;
  ///    for (final row in rows) {
  ///      for (final cell in row.cells) {
  ///        print(cell.hint);
  ///      }
  ///    }
  ///  }
  ///}
  ///```
  Future<WordHintResponse> wordHint({
    String fromLanguage,
    String learningLanguage,
    required String sentence,
  });

  /// Switches the learning language for authenticated users.
  Future<SwitchLanguageResponse> switchLanguage({
    String fromLanguage,
    required String learningLanguage,
  });

  Future<LeaderboardResponse> leaderboard();

  /// Returns the dictionary information linked to [wordId].
  ///
  /// A call to this method will always cause a communication process with the Duolingo API.
  /// If you want to reuse the cached response object, use [cachedDictionary].
  ///
  /// From this API, you can refer to the information on the official Duolingo page at the following URL:
  /// https://www.duolingo.com/dictionary/Japanese/%E6%95%B0%E5%AD%A6/00a6288128ad4e286a35078ded5ffde9
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final authResponse = await duolingo.authenticate(
  ///    username: 'test_username',
  ///    password: 'test_password',
  ///  );
  ///
  ///  final dictionaryResponse = await duolingo.dictionary(
  ///    wordId: 'cbdb71cdcf9e4715771206e1c0b0b94c',
  ///  );
  ///
  ///  print(dictionaryResponse);
  ///
  ///  for (final alternativeForm in dictionaryResponse.alternativeForms) {
  ///    print(alternativeForm);
  ///  }
  ///
  ///  for (final discussion in dictionaryResponse.relatedDiscussions) {
  ///    print(discussion);
  ///  }
  ///
  ///  for (final lexeme in dictionaryResponse.relatedLexemes) {
  ///    print(lexeme);
  ///  }
  ///}
  ///```
  Future<DictionaryResponse> dictionary({
    required String wordId,
  });

  Future<SubscriptionsResponse> subscriptions({
    String userId,
  });

  Future<SubscribersResponse> subscribers({
    String userId,
  });

  Future<ShopItemsResponse> shopItems();

  Future<PurchaseResponse> purchase({
    required String itemId,
  });

  Future<AlphabetsResponse> alphabets({
    String fromLanguage,
    String learningLanguage,
  });

  Future<StoriesResponse> stories({
    IllustrationFormat format = IllustrationFormat.svg,
  });

  Future<FollowResponse> follow({
    required String targetUserId,
  });

  Future<UnfollowResponse> unfollow({
    required String targetUserId,
  });

  Future<AchievementsResponse> achievements({
    String userId,
    String fromLanguage,
    String learningLanguage,
  });

  Future<ForumTopicsResponse> forumTopics();

  Future<ForumTopicResponse> forumTopic({
    required int topicId,
  });

  Future<ForumCommentResponse> forumComment({
    required int commentId,
  });

  Future<SearchFriendResponse> searchFriend({
    int page,
    int perPage,
    required String query,
  });

  Future<RecommendationsResponse> recommendations({
    String userId,
  });

  Future<SearchForumResponse> searchForum({
    int page = 0,
    int perPage = 10,
    required String query,
  });

  Future<ForumCommentsResponse> forumComments({
    int page = 0,
    ForumCommentsSortPattern sortPattern = ForumCommentsSortPattern.newest,
    int topicId = -1,
  });

  Future<ManifestResponse> cachedManifest();

  /// Returns cached metadata about the configuration of the Duolingo service.
  ///
  /// The first call to this [cachedVersionInfo] method will always result in a communication with the Duolingo API
  /// because there is no cached [VersionInfoResponse]. In the second and subsequent method calls, the cached [VersionInfoResponse]
  /// from the first method call will be returned.
  ///
  /// The type and data structure of the response is consistent with the [versionInfo] method. However, please note that
  /// the cached data is returned from this method, so unless you explicitly delete this cached object data,
  /// the cached response object will always be returned.
  ///
  /// To delete the explicitly cached [VersionInfoResponse], call the [cleanCacheVersionInfo] method.
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final versionInfoResponse = await duolingo.cachedVersionInfo();
  ///  final ttsVoiceConfiguration = versionInfoResponse.ttsVoiceConfiguration;
  ///
  ///  for (final voiceDirection in ttsVoiceConfiguration.voiceDirections) {
  ///    print(voiceDirection.language);
  ///    print(voiceDirection.voice);
  ///  }
  ///
  ///  // Delete cache.
  ///  duolingo.cleanCacheVersionInfo();
  ///}
  ///```
  Future<VersionInfoResponse> cachedVersionInfo();

  /// Returns cached the authenticated user information from [userId].
  ///
  /// The first call to this [cachedUser] method will always result in a communication with the Duolingo API
  /// because there is no cached [UserResponse]. In the second and subsequent method calls, the cached [UserResponse]
  /// from the first method call will be returned.
  ///
  /// The type and data structure of the response is consistent with the [user] method. However, please note that
  /// the cached data is returned from this method, so unless you explicitly delete this cached object data,
  /// the cached response object will always be returned.
  ///
  /// To delete the explicitly cached [UserResponse], call the [cleanCachedUser] method.
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final authResponse = await duolingo.authenticate(
  ///    username: 'test_username',
  ///    password: 'test_password',
  ///  );
  ///
  ///  final userResponse = await duolingo.cachedUser(userId: authResponse.userId);
  ///
  ///  print(userResponse.name);
  ///  print(userResponse.lingots);
  ///
  ///  for (final course in userResponse.courses) {
  ///    print(course.title);
  ///    print(course.xp);
  ///  }
  ///
  ///  // Skill information is stored in a hierarchical structure.
  ///  final skillBook = userResponse.currentCourse.skillBook;
  ///
  ///  for (final chapter in skillBook.chapters) {
  ///    for (final content in chapter.contents) {
  ///      if (content.isAccessible) {
  ///        print(content.name);
  ///        print(content.proficiency);
  ///        print(content.tipsAndNotes);
  ///      }
  ///    }
  ///  }
  ///
  ///  // If you don't like the nested structure,
  ///  // you can use the toFlat method to make the structure flat.
  ///  //
  ///  // If you use the toFlat method, all the skill information that
  ///  // exists in SkillBook will be returned as a new list.
  ///  for (final skill in skillBook.toFlat()) {
  ///    if (skill.isAccessible) {
  ///      print(skill.name);
  ///      print(skill.proficiency);
  ///      print(skill.tipsAndNotes);
  ///    }
  ///  }
  ///
  ///  // Delete cache.
  ///  duolingo.cleanCachedUser();
  ///}
  ///```
  Future<UserResponse> cachedUser({
    String userId,
  });

  /// Returns cached all learned words associated with the language that
  /// the authenticated user is currently learning.
  ///
  /// The first call to this [cachedOverview] method will always result in a communication with the Duolingo API
  /// because there is no cached [OverviewResponse]. In the second and subsequent method calls, the cached [OverviewResponse]
  /// from the first method call will be returned.
  ///
  /// The type and data structure of the response is consistent with the [overview] method. However, please note that
  /// the cached data is returned from this method, so unless you explicitly delete this cached object data,
  /// the cached response object will always be returned.
  ///
  /// To delete the explicitly cached [OverviewResponse], call the [cleanCachedOverview] method.
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final authResponse = await duolingo.authenticate(
  ///    username: 'test_username',
  ///    password: 'test_password',
  ///  );
  ///
  ///  final overviewResponse = await duolingo.cachedOverview();
  ///
  ///  for (final vocabulary in overviewResponse.vocabularies) {
  ///      print(vocabulary.word);
  ///
  ///  // Delete cache.
  ///  duolingo.cleanCachedOverview();
  ///}
  ///```
  Future<OverviewResponse> cachedOverview();

  /// Returns cached hint information of [sentence] specified in the argument.
  ///
  /// For [fromLanguage], specify the language of the hint information,
  /// and for [learningLanguage], specify the language of the word
  /// or sentence specified in [sentence].
  ///
  /// The first call to this [cachedWordHint] method will always result in a communication with the Duolingo API
  /// because there is no cached [WordHintResponse]. In the second and subsequent method calls, the cached [WordHintResponse]
  /// from the first method call will be returned.
  ///
  /// The type and data structure of the response is consistent with the [wordHint] method. However, please note that
  /// the cached data is returned from this method, so unless you explicitly delete this cached object data,
  /// the cached response object will always be returned.
  ///
  /// To delete the explicitly cached [WordHintResponse], call the [cleanCachedWordHint] method.
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final wordHintResponse = await duolingo.cachedWordHint(
  ///    fromLanguage: 'en',
  ///    learningLanguage: 'es',
  ///    sentence: 'boligrafos',
  ///  );
  ///
  ///  for (final token in wordHintResponse.tokens) {
  ///    final headers = token.table.headers;
  ///    for (final header in headers) {
  ///      print(header.selected);
  ///      print(header.token);
  ///    }
  ///
  ///    final rows = token.table.rows;
  ///    for (final row in rows) {
  ///      for (final cell in row.cells) {
  ///        print(cell.hint);
  ///      }
  ///    }
  ///  }
  ///
  ///  // Delete cache.
  ///  duolingo.cleanCachedWordHint();
  ///}
  ///```
  Future<WordHintResponse> cachedWordHint({
    String fromLanguage,
    String learningLanguage,
    required String sentence,
  });

  Future<LeaderboardResponse> cachedLeaderboard();

  /// Returns cached dictionary information linked to [wordId].
  ///
  /// From this API, you can refer to the information on the official Duolingo page at the following URL:
  /// https://www.duolingo.com/dictionary/Japanese/%E6%95%B0%E5%AD%A6/00a6288128ad4e286a35078ded5ffde9
  ///
  /// The first call to this [cachedDictionary] method will always result in a communication with the Duolingo API
  /// because there is no cached [DictionaryResponse]. In the second and subsequent method calls, the cached [DictionaryResponse]
  /// from the first method call will be returned.
  ///
  /// The type and data structure of the response is consistent with the [dictionary] method. However, please note that
  /// the cached data is returned from this method, so unless you explicitly delete this cached object data,
  /// the cached response object will always be returned.
  ///
  /// To delete the explicitly cached [DictionaryResponse], call the [cleanCachedDictionary] method.
  ///
  /// **_Example:_**
  ///
  ///```dart
  ///void main() async {
  ///  final duolingo = Duolingo.instance;
  ///
  ///  final authResponse = await duolingo.authenticate(
  ///    username: 'test_username',
  ///    password: 'test_password',
  ///  );
  ///
  ///  final dictionaryResponse = await duolingo.cachedDictionary(
  ///    wordId: 'cbdb71cdcf9e4715771206e1c0b0b94c',
  ///  );
  ///
  ///  print(dictionaryResponse);
  ///
  ///  for (final alternativeForm in dictionaryResponse.alternativeForms) {
  ///    print(alternativeForm);
  ///  }
  ///
  ///  for (final discussion in dictionaryResponse.relatedDiscussions) {
  ///    print(discussion);
  ///  }
  ///
  ///  for (final lexeme in dictionaryResponse.relatedLexemes) {
  ///    print(lexeme);
  ///  }
  ///}
  ///```
  Future<DictionaryResponse> cachedDictionary({
    required String wordId,
  });

  Future<SubscriptionsResponse> cachedSubscriptions({
    String userId,
  });

  Future<SubscribersResponse> cachedSubscribers({
    String userId,
  });

  Future<ShopItemsResponse> cachedShopItems();

  Future<AlphabetsResponse> cachedAlphabets({
    String fromLanguage,
    String learningLanguage,
  });

  Future<StoriesResponse> cachedStories({
    String fromLanguage,
    String learningLanguage,
    IllustrationFormat format = IllustrationFormat.svg,
  });

  Future<AchievementsResponse> cachedAchievements({
    String userId,
    String fromLanguage,
    String learningLanguage,
  });

  Future<ForumTopicsResponse> cachedForumTopics();

  Future<ForumTopicResponse> cachedForumTopic({
    required int topicId,
  });

  Future<ForumCommentResponse> cachedForumComment({
    required int commentId,
  });

  /// Deletes all cached response objects.
  void cleanCache();

  /// Deletes the cached data of the response object that was cached by calling the [cachedManifest] method.
  void cleanCachedManifest();

  /// Deletes the cached data of the response object that was cached by calling the [cachedVersionInfo] method.
  void cleanCachedVersionInfo();

  /// Deletes the cached data of the response object that was cached by calling the [cachedUser] method.
  void cleanCachedUser();

  /// Deletes the cached data of the response object that was cached by calling the [cachedOverview] method.
  void cleanCachedOverview();

  /// Deletes the cached data of the response object that was cached by calling the [cachedWordHint] method.
  void cleanCachedWordHint();

  /// Deletes the cached data of the response object that was cached by calling the [cachedLeaderboard] method.
  void cleanCachedLeaderboard();

  /// Deletes the cached data of the response object that was cached by calling the [cachedDictionary] method.
  void cleanCachedDictionary();

  /// Deletes the cached data of the response object that was cached by calling the [cachedSubscriptions] method.
  void cleanCachedSubscriptions();

  /// Deletes the cached data of the response object that was cached by calling the [cachedSubscribers] method.
  void cleanCachedSubscribers();

  /// Deletes the cached data of the response object that was cached by calling the [cachedShopItems] method.
  void cleanCachedShopItems();

  /// Deletes the cached data of the response object that was cached by calling the [cachedAlphabets] method.
  void cleanCachedAlphabets();

  /// Deletes the cached data of the response object that was cached by calling the [cachedStories] method.
  void cleanCachedStories();

  /// Deletes the cached data of the response object that was cached by calling the [cachedAchievements] method.
  void cleanCachedAchievements();

  /// Deletes the cached data of the response object that was cached by calling the [cachedForumTopics] method.
  void cleanCachedForumTopics();

  /// Deletes the cached data of the response object that was cached by calling the [cachedForumTopic] method.
  void cleanCachedForumTopic();

  /// Deletes the cached data of the response object that was cached by calling the [cachedForumComment] method.
  void cleanCachedForumComment();
}
