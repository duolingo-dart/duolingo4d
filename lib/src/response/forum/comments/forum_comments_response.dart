// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/forum/comment.dart';
import 'package:duolingo4d/src/response/forum/comments/dictionary_path.dart';
import 'package:duolingo4d/src/response/forum/comments/topic.dart';
import 'package:duolingo4d/src/response/forum/user.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

class ForumCommentsResponse extends Response {
  /// Returns the new instance of [ForumCommentsResponse] based on arguments.
  ForumCommentsResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.id,
    required this.title,
    required this.category,
    required this.message,
    required this.markdownMessage,
    required this.translationId,
    required this.translation,
    required this.translationLanguage,
    required this.ttsUrl,
    required this.canonicalUrl,
    required this.likes,
    required this.votes,
    required this.comments,
    required this.parentsTopics,
    required this.rootTopic,
    required this.topic,
    required this.dictionaryPaths,
    required this.user,
    required this.isUserUpvoted,
    required this.isUserDownvoted,
    required this.isAdmin,
    required this.deleted,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The id
  final int id;

  /// The title
  final String title;

  /// The category
  final String category;

  /// The message
  final String message;

  /// The markdown message
  final String markdownMessage;

  /// The translation id
  final String translationId;

  /// The translation
  final String translation;

  /// The translation language
  final String translationLanguage;

  /// The TTS url
  final String ttsUrl;

  /// The canonical url
  final String canonicalUrl;

  /// The number of likes
  final int likes;

  /// The number of votes
  final int votes;

  /// The comments
  final List<Comment> comments;

  /// The parents topics
  final List<Topic> parentsTopics;

  /// The root topic
  final Topic rootTopic;

  /// The topic
  final Topic topic;

  /// The dictionary paths
  final List<DictionaryPath> dictionaryPaths;

  /// The user
  final User user;

  /// The flag that represents user is upvoted or not
  final bool isUserUpvoted;

  /// The flag that represents user is downvoted or not
  final bool isUserDownvoted;

  /// The flag that represents user is admin or not
  final bool isAdmin;

  /// The flag that represents this comment is deleted or not
  final bool deleted;

  @override
  String toString() {
    return 'ForumCommentsResponse(id: $id, title: $title, category: $category, message: $message, markdownMessage: $markdownMessage, translationId: $translationId, translation: $translation, translationLanguage: $translationLanguage, ttsUrl: $ttsUrl, canonicalUrl: $canonicalUrl, likes: $likes, votes: $votes, comments: $comments, parentsTopics: $parentsTopics, rootTopic: $rootTopic, topic: $topic, dictionaryPaths: $dictionaryPaths, user: $user, isUserUpvoted: $isUserUpvoted, isUserDownvoted: $isUserDownvoted, isAdmin: $isAdmin, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ForumCommentsResponse &&
        other.id == id &&
        other.title == title &&
        other.category == category &&
        other.message == message &&
        other.markdownMessage == markdownMessage &&
        other.translationId == translationId &&
        other.translation == translation &&
        other.translationLanguage == translationLanguage &&
        other.ttsUrl == ttsUrl &&
        other.canonicalUrl == canonicalUrl &&
        other.likes == likes &&
        other.votes == votes &&
        listEquals(other.comments, comments) &&
        listEquals(other.parentsTopics, parentsTopics) &&
        other.rootTopic == rootTopic &&
        other.topic == topic &&
        listEquals(other.dictionaryPaths, dictionaryPaths) &&
        other.user == user &&
        other.isUserUpvoted == isUserUpvoted &&
        other.isUserDownvoted == isUserDownvoted &&
        other.isAdmin == isAdmin &&
        other.deleted == deleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        category.hashCode ^
        message.hashCode ^
        markdownMessage.hashCode ^
        translationId.hashCode ^
        translation.hashCode ^
        translationLanguage.hashCode ^
        ttsUrl.hashCode ^
        canonicalUrl.hashCode ^
        likes.hashCode ^
        votes.hashCode ^
        comments.hashCode ^
        parentsTopics.hashCode ^
        rootTopic.hashCode ^
        topic.hashCode ^
        dictionaryPaths.hashCode ^
        user.hashCode ^
        isUserUpvoted.hashCode ^
        isUserDownvoted.hashCode ^
        isAdmin.hashCode ^
        deleted.hashCode;
  }
}
