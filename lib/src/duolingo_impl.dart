// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:cache_storage/cache_storage.dart';

// Project imports:
import 'package:duolingo4d/src/const/forum_comments_sort_pattern.dart';
import 'package:duolingo4d/src/const/illustration_format.dart';
import 'package:duolingo4d/src/duolingo.dart';
import 'package:duolingo4d/src/duolingo_session.dart';
import 'package:duolingo4d/src/request/achievements_request.dart';
import 'package:duolingo4d/src/request/alphabets_request.dart';
import 'package:duolingo4d/src/request/auth_request.dart';
import 'package:duolingo4d/src/request/dictionary_request.dart';
import 'package:duolingo4d/src/request/follow_request.dart';
import 'package:duolingo4d/src/request/forum_comment_request.dart';
import 'package:duolingo4d/src/request/forum_comments_request.dart';
import 'package:duolingo4d/src/request/forum_topic_request.dart';
import 'package:duolingo4d/src/request/forum_topics_request.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/leaderboard_request.dart';
import 'package:duolingo4d/src/request/manifest_request.dart';
import 'package:duolingo4d/src/request/overview_request.dart';
import 'package:duolingo4d/src/request/purchase_request.dart';
import 'package:duolingo4d/src/request/recommendations_request.dart';
import 'package:duolingo4d/src/request/search_forum_request.dart';
import 'package:duolingo4d/src/request/search_friend_request.dart';
import 'package:duolingo4d/src/request/shop_items_request.dart';
import 'package:duolingo4d/src/request/stories_request.dart';
import 'package:duolingo4d/src/request/subscribers_request.dart';
import 'package:duolingo4d/src/request/subscriptions_request.dart';
import 'package:duolingo4d/src/request/switch_language_request.dart';
import 'package:duolingo4d/src/request/unfollow_request.dart';
import 'package:duolingo4d/src/request/user_request.dart';
import 'package:duolingo4d/src/request/version_info_request.dart';
import 'package:duolingo4d/src/request/word_hint_request.dart';
import 'package:duolingo4d/src/resource.dart';

/// This is an implementation class of [Duolingo].
class DuolingoImpl implements Duolingo {
  /// The internal constructor for singleton.
  DuolingoImpl._internal();

  /// Returns the singleton instance of [DuolingoImpl].
  static DuolingoImpl get instance => _singletonInstance;

  /// The singleton instance of [DuolingoImpl].
  static final _singletonInstance = DuolingoImpl._internal();

  /// The cache storage
  static final _cacheStorage = CacheStorage.open();

  @override
  get session => DuolingoSession.from(
        requestHeader: InternalSession.instance.requestHeader,
      );

  @override
  manifest() async => await ManifestRequest.newInstance().send();

  @override
  versionInfo() async => await VersionInfoRequest.newInstance().send();

  @override
  authenticate({
    required String username,
    required String password,
  }) async {
    final response = await AuthRequest.from(
      username: username,
      password: password,
    ).send();

    if (response.hasNotError) {
      // Delete the cache of another user.
      cleanCache();
    }

    return response;
  }

  @override
  user({
    required String userId,
  }) async =>
      await UserRequest.from(userId: userId).send();

  @override
  overview() async => await OverviewRequest.newInstance().send();

  @override
  wordHint({
    required String fromLanguage,
    required String learningLanguage,
    required String sentence,
  }) async =>
      await WordHintRequest.from(
        fromLanguage: fromLanguage,
        learningLanguage: learningLanguage,
        sentence: sentence,
      ).send();

  @override
  switchLanguage({
    required String fromLanguage,
    required String learningLanguage,
  }) async =>
      await SwitchLanguageRequest.from(
        fromLanguage: fromLanguage,
        learningLanguage: learningLanguage,
      ).send();

  @override
  leaderboard({
    required String userId,
  }) async =>
      await LeaderboardRequest.from(userId: userId).send();

  @override
  dictionary({
    required String wordId,
  }) async =>
      await DictionaryRequest.from(wordId: wordId).send();

  @override
  subscriptions({
    required String userId,
  }) async =>
      await SubscriptionsRequest.from(userId: userId).send();

  @override
  subscribers({
    required String userId,
  }) async =>
      await SubscribersRequest.from(userId: userId).send();

  @override
  shopItems() async => await ShopItemsRequest.newInstance().send();

  @override
  purchase({
    required String itemId,
    required String userId,
    required String learningLanguage,
  }) async =>
      await PurchaseRequest.from(
        itemId: itemId,
        userId: userId,
        learningLanguage: learningLanguage,
      ).send();

  @override
  alphabets({
    required String fromLanguage,
    required String learningLanguage,
  }) async =>
      await AlphabetsRequest.from(
        fromLanguage: fromLanguage,
        learningLanguage: learningLanguage,
      ).send();

  @override
  stories({
    required String fromLanguage,
    required String learningLanguage,
    IllustrationFormat format = IllustrationFormat.svg,
  }) async =>
      await StoriesRequest.from(
        fromLanguage: fromLanguage,
        learningLanguage: learningLanguage,
        format: format,
      ).send();

  @override
  follow({
    required String userId,
    required String targetUserId,
  }) async =>
      await FollowRequest.from(
        userId: userId,
        targetUserId: targetUserId,
      ).send();

  @override
  unfollow({
    required String userId,
    required String targetUserId,
  }) async =>
      await UnfollowRequest.from(
        userId: userId,
        targetUserId: targetUserId,
      ).send();

  @override
  achievements({
    required String userId,
    required String fromLanguage,
    required String learningLanguage,
  }) async =>
      await AchievementsRequest.from(
        userId: userId,
        fromLanguage: fromLanguage,
        learningLanguage: learningLanguage,
      ).send();

  @override
  forumTopics() async => ForumTopicsRequest.newInstance().send();

  @override
  forumTopic({
    required int topicId,
  }) async =>
      await ForumTopicRequest.from(topicId: topicId).send();

  @override
  forumComment({
    required int commentId,
  }) async =>
      await ForumCommentRequest.from(commentId: commentId).send();

  @override
  searchFriend({
    required int page,
    required int perPage,
    required String query,
  }) async =>
      await SearchFriendRequest.from(
        page: page,
        perPage: perPage,
        query: query,
      ).send();

  @override
  recommendations({
    required String userId,
  }) async =>
      await RecommendationsRequest.from(userId: userId).send();

  @override
  searchForum({
    int page = 0,
    int perPage = 10,
    required String query,
  }) async =>
      await SearchForumRequest.from(
        page: page,
        perPage: perPage,
        query: query,
      ).send();

  @override
  forumComments({
    int page = 0,
    ForumCommentsSortPattern sortPattern = ForumCommentsSortPattern.newest,
    int topicId = -1,
  }) async =>
      await ForumCommentsRequest.from(
        page: page,
        sortPattern: sortPattern,
        topicId: topicId,
      ).send();

  @override
  cachedManifest() async {
    if (_cacheStorage.has(key: Resource.manifest.name)) {
      return _cacheStorage.match(key: Resource.manifest.name);
    }

    final response = await manifest();
    _cacheStorage.save(key: Resource.manifest.name, value: response);

    return response;
  }

  @override
  cachedVersionInfo() async {
    if (_cacheStorage.has(key: Resource.versionInfo.name)) {
      return _cacheStorage.match(key: Resource.versionInfo.name);
    }

    final response = await versionInfo();
    _cacheStorage.save(key: Resource.versionInfo.name, value: response);

    return response;
  }

  @override
  cachedUser({
    required String userId,
  }) async {
    final cacheSubKeys = [userId];

    if (_cacheStorage.has(key: Resource.user.name, subKeys: cacheSubKeys)) {
      return _cacheStorage.match(
        key: Resource.user.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await user(userId: userId);

    _cacheStorage.save(
      key: Resource.user.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  cachedOverview() async {
    if (_cacheStorage.has(key: Resource.overview.name)) {
      return _cacheStorage.match(key: Resource.overview.name);
    }

    final response = await overview();
    _cacheStorage.save(key: Resource.overview.name, value: response);

    return response;
  }

  @override
  cachedWordHint({
    required String fromLanguage,
    required String learningLanguage,
    required String sentence,
  }) async {
    final cacheSubKeys = <String>[
      fromLanguage,
      learningLanguage,
      sentence,
    ];

    if (_cacheStorage.has(
      key: Resource.wordHint.name,
      subKeys: cacheSubKeys,
    )) {
      return _cacheStorage.match(
        key: Resource.wordHint.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await wordHint(
      fromLanguage: fromLanguage,
      learningLanguage: learningLanguage,
      sentence: sentence,
    );

    _cacheStorage.save(
      key: Resource.wordHint.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  cachedLeaderboard({
    required String userId,
  }) async {
    final cacheSubKeys = [userId];
    if (_cacheStorage.has(
      key: Resource.leaderboard.name,
      subKeys: cacheSubKeys,
    )) {
      return _cacheStorage.match(
        key: Resource.leaderboard.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await leaderboard(userId: userId);

    _cacheStorage.save(
      key: Resource.leaderboard.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  cachedDictionary({
    required String wordId,
  }) async {
    final cacheSubKeys = [wordId];
    if (_cacheStorage.has(
      key: Resource.dictionary.name,
      subKeys: cacheSubKeys,
    )) {
      return _cacheStorage.match(
        key: Resource.dictionary.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await dictionary(wordId: wordId);

    _cacheStorage.save(
      key: Resource.dictionary.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  cachedSubscriptions({
    required String userId,
  }) async {
    final cacheSubKeys = [userId];
    if (_cacheStorage.has(
      key: Resource.subscriptions.name,
      subKeys: cacheSubKeys,
    )) {
      return _cacheStorage.match(
        key: Resource.subscriptions.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await subscriptions(userId: userId);

    _cacheStorage.save(
      key: Resource.subscriptions.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  cachedSubscribers({
    required String userId,
  }) async {
    final cacheSubKeys = [userId];
    if (_cacheStorage.has(
      key: Resource.subscribers.name,
      subKeys: cacheSubKeys,
    )) {
      return _cacheStorage.match(
        key: Resource.subscribers.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await subscribers(userId: userId);

    _cacheStorage.save(
      key: Resource.subscribers.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  cachedShopItems() async {
    if (_cacheStorage.has(key: Resource.shopItems.name)) {
      return _cacheStorage.match(key: Resource.shopItems.name);
    }

    final response = await shopItems();
    _cacheStorage.save(key: Resource.shopItems.name, value: response);

    return response;
  }

  @override
  cachedAlphabets({
    required String fromLanguage,
    required String learningLanguage,
  }) async {
    final cacheSubKeys = [fromLanguage, learningLanguage];
    if (_cacheStorage.has(
      key: Resource.alphabets.name,
      subKeys: cacheSubKeys,
    )) {
      return _cacheStorage.match(
        key: Resource.alphabets.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await alphabets(
      fromLanguage: fromLanguage,
      learningLanguage: learningLanguage,
    );

    _cacheStorage.save(
      key: Resource.alphabets.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  cachedStories({
    required String fromLanguage,
    required String learningLanguage,
    IllustrationFormat format = IllustrationFormat.svg,
  }) async {
    final cacheSubKeys = [fromLanguage, learningLanguage, format.name];
    if (_cacheStorage.has(
      key: Resource.stories.name,
      subKeys: cacheSubKeys,
    )) {
      return _cacheStorage.match(
        key: Resource.stories.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await stories(
      fromLanguage: fromLanguage,
      learningLanguage: learningLanguage,
      format: format,
    );

    _cacheStorage.save(
      key: Resource.stories.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  cachedAchievements({
    required String userId,
    required String fromLanguage,
    required String learningLanguage,
  }) async {
    final cacheSubKeys = [
      userId,
      fromLanguage,
      learningLanguage,
    ];

    if (_cacheStorage.has(
      key: Resource.achievements.name,
      subKeys: cacheSubKeys,
    )) {
      return _cacheStorage.match(
        key: Resource.achievements.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await achievements(
      userId: userId,
      fromLanguage: fromLanguage,
      learningLanguage: learningLanguage,
    );

    _cacheStorage.save(
      key: Resource.achievements.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  cachedForumTopics() async {
    if (_cacheStorage.has(key: Resource.forumTopics.name)) {
      return _cacheStorage.match(key: Resource.forumTopics.name);
    }

    final response = await forumTopics();

    _cacheStorage.save(
      key: Resource.forumTopics.name,
      value: response,
    );

    return response;
  }

  @override
  cachedForumTopic({
    required int topicId,
  }) async {
    final cacheSubKeys = ['$topicId'];
    if (_cacheStorage.has(
      key: Resource.forumTopic.name,
      subKeys: cacheSubKeys,
    )) {
      return _cacheStorage.match(
        key: Resource.forumTopic.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await forumTopic(topicId: topicId);

    _cacheStorage.save(
      key: Resource.forumTopic.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  cachedForumComment({
    required int commentId,
  }) async {
    final cacheSubKeys = ['$commentId'];
    if (_cacheStorage.has(
      key: Resource.forumComments.name,
      subKeys: cacheSubKeys,
    )) {
      return _cacheStorage.match(
        key: Resource.forumComments.name,
        subKeys: cacheSubKeys,
      );
    }

    final response = await forumComment(commentId: commentId);

    _cacheStorage.save(
      key: Resource.forumComments.name,
      subKeys: cacheSubKeys,
      value: response,
    );

    return response;
  }

  @override
  cleanCache() => _cacheStorage.delete();

  @override
  cleanCachedManifest() => _cacheStorage.deleteBy(key: Resource.manifest.name);

  @override
  cleanCachedVersionInfo() =>
      _cacheStorage.deleteBy(key: Resource.versionInfo.name);

  @override
  cleanCachedUser() => _cacheStorage.deleteBy(key: Resource.user.name);

  @override
  cleanCachedOverview() => _cacheStorage.deleteBy(key: Resource.overview.name);

  @override
  cleanCachedWordHint() => _cacheStorage.deleteBy(key: Resource.wordHint.name);

  @override
  cleanCachedLeaderboard() =>
      _cacheStorage.deleteBy(key: Resource.leaderboard.name);

  @override
  cleanCachedDictionary() =>
      _cacheStorage.deleteBy(key: Resource.dictionary.name);

  @override
  cleanCachedSubscriptions() =>
      _cacheStorage.deleteBy(key: Resource.subscriptions.name);

  @override
  cleanCachedSubscribers() =>
      _cacheStorage.deleteBy(key: Resource.subscribers.name);

  @override
  cleanCachedShopItems() =>
      _cacheStorage.deleteBy(key: Resource.shopItems.name);

  @override
  cleanCachedAlphabets() =>
      _cacheStorage.deleteBy(key: Resource.alphabets.name);

  @override
  cleanCachedStories() => _cacheStorage.deleteBy(key: Resource.stories.name);

  @override
  cleanCachedAchievements() =>
      _cacheStorage.deleteBy(key: Resource.achievements.name);

  @override
  cleanCachedForumTopics() =>
      _cacheStorage.deleteBy(key: Resource.forumTopics.name);

  @override
  cleanCachedForumTopic() =>
      _cacheStorage.deleteBy(key: Resource.forumTopic.name);

  @override
  cleanCachedForumComment() =>
      _cacheStorage.deleteBy(key: Resource.forumComment.name);
}
