// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/forum/comment.dart';
import 'package:duolingo4d/src/response/forum/topic/subtopic.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

class ForumTopicResponse extends Response {
  /// Returns the new instance of [ForumTopicResponse] based on arguments.
  ForumTopicResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.id,
    required this.name,
    required this.description,
    required this.fromLanguage,
    required this.learningLanguage,
    required this.skillName,
    required this.includedTopicIds,
    required this.troubleshootingId,
    required this.isAdmin,
    required this.isSubscribed,
    required this.comments,
    required this.subtopics,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The id
  final int id;

  /// The name
  final String name;

  /// The description
  final String description;

  /// The from language
  final String fromLanguage;

  /// The learning language
  final String learningLanguage;

  /// The skill name
  final String skillName;

  /// The included topic IDs
  final List<int> includedTopicIds;

  /// The troubleshooting id
  final int troubleshootingId;

  /// The flag that represents this user is admin of this topic or not
  final bool isAdmin;

  /// The flag that represents this user is subscribed this topic or not
  final bool isSubscribed;

  /// The comments
  final List<Comment> comments;

  /// The subtopics
  final List<Subtopic> subtopics;

  @override
  String toString() {
    return 'ForumTopicResponse(id: $id, name: $name, description: $description, fromLanguage: $fromLanguage, learningLanguage: $learningLanguage, skillName: $skillName, includedTopicIds: $includedTopicIds, troubleshootingId: $troubleshootingId, isAdmin: $isAdmin, isSubscribed: $isSubscribed, comments: $comments, subtopics: $subtopics)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ForumTopicResponse &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.fromLanguage == fromLanguage &&
        other.learningLanguage == learningLanguage &&
        other.skillName == skillName &&
        listEquals(other.includedTopicIds, includedTopicIds) &&
        other.troubleshootingId == troubleshootingId &&
        other.isAdmin == isAdmin &&
        other.isSubscribed == isSubscribed &&
        listEquals(other.comments, comments) &&
        listEquals(other.subtopics, subtopics);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        fromLanguage.hashCode ^
        learningLanguage.hashCode ^
        skillName.hashCode ^
        includedTopicIds.hashCode ^
        troubleshootingId.hashCode ^
        isAdmin.hashCode ^
        isSubscribed.hashCode ^
        comments.hashCode ^
        subtopics.hashCode;
  }
}
