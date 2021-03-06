![duolingo4d](https://user-images.githubusercontent.com/13072231/144712046-e495a2d4-4167-4d9b-8865-330d8aa54f90.png)

**_A most easily usable Duolingo API wrapper in Dart!_**

[![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/myConsciousness/duolingo4d)
[![Gmail](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](https://mail.google.com/mail/u/0/?to=kato.shinya.dev@gmail.com&fs=1&tf=cm)
[![Line](https://img.shields.io/badge/Line-00C300?style=for-the-badge&logo=line&logoColor=white)](https://line.me/ti/p/YP2nycjVCb)
[![Twitter](https://img.shields.io/badge/Twitter-%231DA1F2.svg?style=for-the-badge&logo=Twitter&logoColor=white)](https://twitter.com/ThinkitShinya)

[![pub package](https://img.shields.io/pub/v/duolingo4d.svg)](https://pub.dev/packages/duolingo4d)
[![codecov](https://codecov.io/gh/myConsciousness/duolingo4d/branch/main/graph/badge.svg?token=WSDQK66FQC)](https://codecov.io/gh/myConsciousness/duolingo4d)
[![Analyzer](https://github.com/myConsciousness/duolingo4d/actions/workflows/analyzer.yml/badge.svg)](https://github.com/myConsciousness/duolingo4d/actions/workflows/analyzer.yml)
[![Test](https://github.com/myConsciousness/duolingo4d/actions/workflows/test.yml/badge.svg)](https://github.com/myConsciousness/duolingo4d/actions/workflows/test.yml)

<!-- TOC -->

- [1. About](#1-about)
  - [1.1. Supported Duolingo API](#11-supported-duolingo-api)
  - [1.2. Introduction](#12-introduction)
    - [1.2.1. Install Library](#121-install-library)
    - [1.2.2. Import It](#122-import-it)
    - [1.2.3. Use Duolingo4D](#123-use-duolingo4d)
  - [1.3. Using](#13-using)
    - [1.3.1. Manifest](#131-manifest)
    - [1.3.2. Version Info API](#132-version-info-api)
    - [1.3.3. Authentication API](#133-authentication-api)
    - [1.3.4. User API](#134-user-api)
    - [1.3.5. Overview API](#135-overview-api)
    - [1.3.6. Word Hint API](#136-word-hint-api)
    - [1.3.7. Switch Language API](#137-switch-language-api)
    - [1.3.8. Leaderboard API](#138-leaderboard-api)
    - [1.3.9. Dictionary API](#139-dictionary-api)
    - [1.3.10. Subscriptions API](#1310-subscriptions-api)
    - [1.3.11. Subscribers API](#1311-subscribers-api)
    - [1.3.12. Follow API](#1312-follow-api)
    - [1.3.13. Unfollow API](#1313-unfollow-api)
    - [1.3.14. Shop Items API](#1314-shop-items-api)
    - [1.3.15. Purchase API](#1315-purchase-api)
    - [1.3.16. Alphabets API](#1316-alphabets-api)
    - [1.3.17. Stories API](#1317-stories-api)
    - [1.3.18. Achievements API](#1318-achievements-api)
    - [1.3.19. Forum Topics API](#1319-forum-topics-api)
    - [1.3.20. Forum Topic API](#1320-forum-topic-api)
    - [1.3.21. Forum Comments API](#1321-forum-comments-api)
    - [1.3.22. Forum Comment API](#1322-forum-comment-api)
    - [1.3.23. Search Friend API](#1323-search-friend-api)
    - [1.3.24. Recommendations API](#1324-recommendations-api)
    - [1.3.25. Search Forum API](#1325-search-forum-api)
  - [1.4. License](#14-license)
  - [1.5. More Information](#15-more-information)

<!-- /TOC -->

# 1. About

`Duolingo4D` is an open-sourced Dart library.</br>
With `Duolingo4D`, you can easily integrate your application with the Duolingo API.

`Duolingo4D` is an unofficial library.

[Duolingo](https://www.duolingo.com/) does not publish any official API references or specifications, so I reverse-engineered Duolingo by analyzing its communication content.

## 1.1. Supported Duolingo API

|                     | Auth Required | Remarks                                                                                                            |
| :------------------ | :-----------: | :----------------------------------------------------------------------------------------------------------------- |
| **Manifest**        |      ???       | You can get the manifest information of Duolingo.                                                                  |
| **Version Info**    |      ???       | You can fetch metadata about the various configurations of services in Duolingo.                                   |
| **Authentication**  |      ???       | Authenticate user by using Duolingo registered username or email address and password.                             |
| **User**            |      ???       | You can fetch detailed user information.                                                                           |
| **Overview**        |      ???       | You can fetch information on all the words user have learned in Duolingo.                                          |
| **Word Hint**       |      ???       | You can fetch hint information about words and sentences.                                                          |
| **Switch Language** |      ???       | You can switch the learning language.                                                                              |
| **Leaderboard**     |      ???       | You can get the information of leaderboard.                                                                        |
| **Dictionary**      |      ???       | You can get detailed information including discussions, audio and sample sentences associated with specific words. |
| **Subscriptions**   |      ???       | You can get information about all following users associated with a user id.                                       |
| **Subscribers**     |      ???       | You can get information about all followers associated with a user id.                                             |
| **Follow**          |      ???       | You can follow the account associated with the user ID specified in the argument.                                  |
| **Unfollow**        |      ???       | You can unfollow the account associated with the user ID specified in the argument.                                |
| **Shop Items**      |      ???       | You can get a list of items that can be purchased in Duolingo.                                                     |
| **Purchase**        |      ???       | You can purchase items sold in Duoligno by spending Lingots or Gems.                                               |
| **Alphabets**       |      ???       | You can get alphabet information for the learning language.                                                        |
| **Stories**         |      ???       | You can get story information for the learning language.                                                           |
| **Achievements**    |      ???       | You can get the achievement data that the user has achieved.                                                       |
| **Forum Topics**    |      ???       | You can get a list of forum topics related to the language you are currently learning.                             |
| **Forum Topic**     |      ???       | You can get a forum topic related to the language you are currently learning and topic id.                         |
| **Forum Comments**  |      ???       | You can get forum comments.                                                                                        |
| **Forum Comment**   |      ???       | You can get forum comment related to the language you are currently learning and comment id.                       |
| **Search Friend**   |      ???       | You can search users registered on Duolingo by search word.                                                        |
| **Recommendations** |      ???       | You can get recommended users on Duolingo.                                                                         |
| **Search Forum**    |      ???       | You can get search forums on Duolingo.                                                                             |

## 1.2. Introduction

### 1.2.1. Install Library

**_With Dart:_**

```terminal
 dart pub add duolingo4d
```

**_With Flutter:_**

```terminal
 flutter pub add duolingo4d
```

### 1.2.2. Import It

```dart
import 'package:duolingo4d/duolingo4d.dart';
```

### 1.2.3. Use Duolingo4D

The easiest way to use it is to get a singleton instance from `Duolingo` and call each method.

All response entities returned from the methods of `Duolingo` contain status codes and header information when HTTP communication is performed in internal processing.

For example, when performing the authentication process for a user, it will look like this:

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  if (authResponse.status.isNotOk) {
    // Client or Server error or something.
    authResponse.status.reasonPhrase;
    authResponse.headers;
    return;
  }

  if (authResponse.hasError) {
    // When there is an error on authentication.
    final authError = authResponse.error!;
    print(authError.code);
    print(authError.reason);

    authError.isInvalidUser; // Returns true if user is invalid.
    authError.isInvalidPassword; // Returns true if password is invalid.
    return;
  }

  // Do something if user is authenticated.
}
```

## 1.3. Using

### 1.3.1. Manifest

| Auth Required |                                             Method                                              |                                                   JSON                                                   |
| :-----------: | :---------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------: |
|      ???       | [manifest()](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/manifest.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/10_manifest/response.json) |

You can get the manifest information of Duolingo.

This manifest information includes information about Duolingo icons and the theme and background colors used by Duolingo.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final response = await duolingo.manifest();
  print(response);
}
```

### 1.3.2. Version Info API

| Auth Required |                                                Method                                                 |                                                     JSON                                                     |
| :-----------: | :---------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------: |
|      ???       | [versionInfo()](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/versionInfo.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/01_version_info/response.json) |

The Version Info API allows you to fetch metadata about the configuration of Duolingo services.</br>
This metadata includes the TTS data used to play back the audio of the words, as well as mapping information for the languages supported by Duolingo.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final versionInfoResponse = await duolingo.versionInfo();
  final ttsVoiceConfiguration = versionInfoResponse.ttsVoiceConfiguration;

  for (final voiceDirection in ttsVoiceConfiguration.voiceDirections) {
    print(voiceDirection.language);
    print(voiceDirection.voice);
  }
}
```

### 1.3.3. Authentication API

| Auth Required |                                                                           Method                                                                            |                                                     JSON                                                      |
| :-----------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------: |
|      ???       | [authenticate({required String username, required String password})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/authenticate.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/02_login/response_success.json) |

You can use username and password to authenticate user registered with Duolingo. The registered e-mail address can be used for authentication in addition to the username.

In order to fetch the response you expect from each API that requires authentication, at first you need to use this authentication API to authenticate that the username and password entered are valid.

> **_Note:_**</br>
> When a user is authenticated, the cookie information and session information for the Duolingo service is managed internally by Duolingo4D, so there is no need to be aware of this information after calling the API.
>
> **_Caution:_**</br>
> If you try to authenticate again using information from an account that has already been authenticated, the Duolingo API will return an invalid password response.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  if (authResponse.status.isNotOk) {
    // Client or Server error or something.
    authResponse.status.reasonPhrase;
    authResponse.headers;
    return;
  }

  if (authResponse.hasError) {
    // When there is an error on authentication.
    final authError = authResponse.error!;
    print(authError.code);
    print(authError.reason);

    authError.isInvalidUser; // Returns true if user is invalid.
    authError.isInvalidPassword; // Returns true if password is invalid.
    return;
  }

  // Do something if user is authenticated.
}
```

### 1.3.4. User API

| Auth Required |                                                     Method                                                      |                                                 JSON                                                  |
| :-----------: | :-------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------: |
|      ???       | [user({required String userId})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/user.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/03_users/response.json) |

From the User API, you can get detailed user information associated with the user ID.

The user ID is included in the response returned when the user authentication is completed. Please refer to the following implementation for details.

The user information also includes all the course information and skill information user have learned.

If user authentication has not been completed, data cannot be fetched.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final userResponse = await duolingo.user(userId: authResponse.userId);

  print(userResponse.name);
  print(userResponse.lingots);

  for (final course in userResponse.courses) {
    print(course.title);
    print(course.xp);
  }

  // Skill information is stored in a hierarchical structure.
  final skillBook = userResponse.currentCourse.skillBook;

  for (final chapter in skillBook.chapters) {
    for (final content in chapter.contents) {
      if (content.isAccessible) {
        print(content.name);
        print(content.proficiency);
        print(content.tipsAndNotes);
      }
    }
  }

  // If you don't like the nested structure,
  // you can use the toFlat method to make the structure flat.
  //
  // If you use the toFlat method, all the skill information that
  // exists in SkillBook will be returned as a new list.
  for (final skill in skillBook.toFlat()) {
    if (skill.isAccessible) {
      print(skill.name);
      print(skill.proficiency);
      print(skill.tipsAndNotes);
    }
  }
}
```

### 1.3.5. Overview API

| Auth Required |                                             Method                                              |                                                   JSON                                                   |
| :-----------: | :---------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------: |
|      ???       | [overview()](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/overview.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/04_overview/response.json) |

From the Overview API, you can fetch information about all the words you have learned in the course you have selected. The details that can be retrieved about a word will vary depending on the course and word.

If user authentication has not been completed, data cannot be fetched.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final overviewResponse = await duolingo.overview();

  for (final vocabulary in overviewResponse.vocabularies) {
      print(vocabulary.word);
  }
}
```

### 1.3.6. Word Hint API

| Auth Required |                                                                                          Method                                                                                           |                                                   JSON                                                   |
| :-----------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------: |
|      ???       | [wordHint({required String fromLanguage, required String learningLanguage, required String sentence})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/wordHint.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/05_hints/response_ja.json) |

You can fetch hint information for any word or sentence from the Word Hint API. Since the hint information is hint data managed by Duolingo, the accuracy of the translation data cannot be guaranteed.

The argument `learningLanguage` should be the language code corresponding to the word, and `fromLanguage` should be the language code corresponding to the hint. The `sentence` can be sentences as well as single words.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final wordHintResponse = await duolingo.wordHint(
    fromLanguage: 'en',
    learningLanguage: 'es',
    sentence: 'bol??grafos',
  );

  for (final token in wordHintResponse.tokens) {
    final headers = token.table.headers;
    for (final header in headers) {
      print(header.selected);
      print(header.token);
    }

    final rows = token.table.rows;
    for (final row in rows) {
      for (final cell in row.cells) {
        print(cell.hint);
      }
    }
  }

  // If you don't like the complex structure described above,
  // you can convert it to a simpler structure.
  print(wordHintResponse.prettify());
}
```

### 1.3.7. Switch Language API

| Auth Required |                                                                                   Method                                                                                    |
| :-----------: | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
|      ???       | [switchLanguage({required String fromLanguage, required String learningLanguage})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/switchLanguage.html) |

The Switch Language API allows you to switch between the courses supported by Duolingo. The mapping information for the courses that can be switched using the Switch Language API can be obtained from the Version Info API.

For the argument `learningLanguage`, specify the language to be learned after switching. And for `fromLanguage`, specify the language to be used when learning that `learningLanguage`.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final switchLanguageResponse = await duolingo.switchLanguage(
    fromLanguage: 'es',
    learningLanguage: 'en',
  );

  print(switchLanguageResponse.statusCode);
  print(switchLanguageResponse.reasonPhrase);
}
```

### 1.3.8. Leaderboard API

| Auth Required |                                                            Method                                                             |                                                    JSON                                                     |
| :-----------: | :---------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------: |
|      ???       | [leaderboard({required String userId})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/leaderboard.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/13_leaderboard/response.json) |

The Leaderboard API allows you to get information about leaderboard on Duolingo.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final leaderboardResponse =
      await duolingo.leaderboard(userId: authResponse.userId);
  print(leaderboardResponse);

  final ativeThread = leaderboardResponse.activeThread;
  print(ativeThread);
  print(ativeThread.cohort);

  for (final rank in ativeThread.cohort.ranks) {
    // You can get the leaderboard ranking in ascending order of score.
    print(rank);
  }
}
```

### 1.3.9. Dictionary API

| Auth Required |                                                           Method                                                            |                                                     JSON                                                      |
| :-----------: | :-------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------: |
|      ???       | [dictionary({required String wordId})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/dictionary.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/08_dictionary/response_en.json) |

Dictionary API allows you to get detailed information including discussion information associated with a particular word, URL to audio data, and sample sentences.

Specifically, you can get the information on [this page](https://www.duolingo.com/dictionary/Japanese/%E6%95%B0%E5%AD%A6/00a6288128ad4e286a35078ded5ffde9) on the official Duolingo.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final dictionaryResponse = await duolingo.dictionary(
    wordId: 'cbdb71cdcf9e4715771206e1c0b0b94c',
  );

  print(dictionaryResponse);

  for (final alternativeForm in dictionaryResponse.alternativeForms) {
    print(alternativeForm);
  }

  for (final discussion in dictionaryResponse.relatedDiscussions) {
    print(discussion);
  }

  for (final lexeme in dictionaryResponse.relatedLexemes) {
    print(lexeme);
  }
}
```

### 1.3.10. Subscriptions API

| Auth Required |                                                              Method                                                               |                                                     JSON                                                      |
| :-----------: | :-------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------: |
|      ???       | [subscriptions({required String userId})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/subscriptions.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/09_subscriptions/response.json) |

From Subscriptions API, you can get information about all following users associated with a user id.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final subscriptionsResponse = await duolingo.subscriptions(userId: 'xxxxxx');
  print(subscriptionsResponse);

  for (final followingUser in subscriptionsResponse.followingUsers) {
    print(followingUser);
  }
}
```

### 1.3.11. Subscribers API

| Auth Required |                                                            Method                                                             |                                                    JSON                                                     |
| :-----------: | :---------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------: |
|      ???       | [subscribers({required String userId})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/subscribers.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/20_subscribers/response.json) |

From Subscribers API, you can get information about all followers associated with a user id.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final subscribersResponse = await duolingo.subscribers(
    userId: authResponse.userId,
  );

  print(subscribersResponse);

  for (final follower in subscribersResponse.followers) {
    print(follower);
  }
}
```

### 1.3.12. Follow API

| Auth Required |                                                                      Method                                                                       |
| :-----------: | :-----------------------------------------------------------------------------------------------------------------------------------------------: |
|      ???       | [follow({required String userId, required String targetUserId})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/follow.html) |

With Follow API, you can follow the account associated with the user ID specified in the argument.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final followResponse = await duolingo.follow(
    userId: authResponse.userId,
    targetUserId: 'user_id_to_follow',
  );

  print(followResponse);
}
```

### 1.3.13. Unfollow API

| Auth Required |                                                                        Method                                                                         |
| :-----------: | :---------------------------------------------------------------------------------------------------------------------------------------------------: |
|      ???       | [unfollow({required String userId, required String targetUserId})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/unfollow.html) |

With Unfollow API, you can unfollow the account associated with the user ID specified in the argument.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final unfollowResponse = await duolingo.unfollow(
    userId: authResponse.userId,
    targetUserId: 'user_id_to_unfollow',
  );

  print(unfollowResponse);
}
```

### 1.3.14. Shop Items API

| Auth Required |                                              Method                                               |                                                    JSON                                                    |
| :-----------: | :-----------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------: |
|      ???       | [shopItems()](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/shopItems.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/11_shop_items/response.json) |

From Shop Items API, you can get a list of items that can be purchased in Duolingo.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final shopItemsResponse = await duolingo.shopItems();

  for (final product in shopItemsResponse.products) {
    print(product);
  }
}
```

### 1.3.15. Purchase API

| Auth Required |                                                                                      Method                                                                                       |                                                   JSON                                                   |
| :-----------: | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------: |
|      ???       | [purchase({required String itemId, required String userId, required String learningLanguage})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/purchase.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/12_purchase/response.json) |

With Purchase API, you can purchase items sold in Duoligno by spending Lingots or Gems.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final userResponse = await duolingo.user(userId: authResponse.userId);
  final shopItemsResponse = await duolingo.shopItems();

  final response = await duolingo.purchase(
    itemId: shopItemsResponse.products[0].id,
    userId: userResponse.id,
    learningLanguage: userResponse.learningLanguage,
  );

  print(response);

  if (response.isNotEstablished) {
    // It indicates purchase request was failed.
    return;
  }
}
```

### 1.3.16. Alphabets API

| Auth Required |                                                                              Method                                                                               |                                                   JSON                                                    |
| :-----------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------: |
|      ???       | [alphabets({required String fromLanguage, required String learningLanguage})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/alphabets.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/14_alphabets/response.json) |

With Alphabets API, you can get alphabet information for the learning language.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final alphabetsResponse = await duolingo.alphabets(
    fromLanguage: 'en',
    learningLanguage: 'ja',
  );

  print(alphabetsResponse);

  for (final alphabet in alphabetsResponse.alphabets) {
    print(alphabet);

    for (final group in alphabet.groups) {
      print(group);

      for (final character in group.characters) {
        if (character.isEmpty) {
          // The empty state of this character indicates a space
          // in the alphabetic table.
          continue;
        }

        print(character.value);
        print(character.transliteration);
        print(character.ttsUrl);
        print(character.proficiency);
      }
    }
  }
}
```

### 1.3.17. Stories API

| Auth Required |                                                                                                      Method                                                                                                       |                                                  JSON                                                   |
| :-----------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------: |
|      ???       | [stories({required String fromLanguage, required String learningLanguage, IllustrationFormat format = IllustrationFormat.svg})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/stories.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/15_stories/response.json) |

With Stories API, you can get story information for the learning language.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final storiesResponse = await duolingo.stories(
    fromLanguage: 'en',
    learningLanguage: 'ja',
    // You can select format in SVG, PNG and PDF.
    // The default is SVG.
    format: IllustrationFormat.png,
  );

  print(storiesResponse);

  for (final story in storiesResponse.stories) {
    print(story);
  }
}
```

### 1.3.18. Achievements API

| Auth Required |                                                                                             Method                                                                                              |                                                     JSON                                                     |
| :-----------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------: |
|      ???       | [achievements({required String userId, required String fromLanguage, required String learningLanguage})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/achievements.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/16_achievements/response.json) |

From Achievements API, you can get the achievement data that the user has achieved.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final achievementsResponse = await duolingo.achievements(
    userId: authResponse.userId,
    fromLanguage: 'en',
    learningLanguage: 'ja',
  );

  print(achievementsResponse);

  for (final achievement in achievementsResponse.achievements) {
    print(achievement);
  }
}
```

### 1.3.19. Forum Topics API

| Auth Required |                                                Method                                                 |                                                     JSON                                                     |
| :-----------: | :---------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------: |
|      ???       | [forumTopics()](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/forumTopics.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/17_forum_topics/response.json) |

From Forum Topics API, you can get a list of forum topics related to the language you are currently learning.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final forumTopicsResponse = await duolingo.forumTopics();
  print(forumTopicsResponse);

  for (final forumTopic in forumTopicsResponse.forumTopics) {
    print(forumTopic);
  }
}
```

### 1.3.20. Forum Topic API

| Auth Required |                                                          Method                                                           |                                                    JSON                                                     |
| :-----------: | :-----------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------: |
|      ???       | [forumTopic({required int topicId})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/forumTopic.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/18_forum_topic/response.json) |

From Forum Topic API, you can get a forum topic related to the language you are currently learning and topic id.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final forumTopicResponse = await duolingo.forumTopic(topicId: 909);
  print(forumTopicResponse);

  for (final comment in forumTopicResponse.comments) {
    print(comment);
  }

  for (final subtopic in forumTopicResponse.subtopics) {
    print(subtopic);
  }
}
```

### 1.3.21. Forum Comments API

| Auth Required |                                                                                                      Method                                                                                                       |                                                      JSON                                                      |
| :-----------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------: |
|      ???       | [forumComments({int page = 0, ForumCommentsSortPattern sortPattern = ForumCommentsSortPattern.newest, int topicId = -1})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/forumComments.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/24_forum_comments/response.json) |

From Forum Comments API, you can get forum comments.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  // You can use this api without arguments and it's optional.
  final forumCommentsResponse = await duolingo.forumComments();
  print(forumCommentsResponse);

  if (forumCommentsResponse.hasMore) {
    for (final comment in forumCommentsResponse.comments) {
      final response = await duolingo.forumComments(
        page: 1, // The paging is supported for this API.
        sortPattern: ForumCommentsSortPattern.hot, //  You can choose sort pattern.
        topicId: comment.topic!.id, // You can get comments on specific topics.
      );

      print(response);
    }
  }
}
```

### 1.3.22. Forum Comment API

| Auth Required |                                                             Method                                                              |                                                     JSON                                                      |
| :-----------: | :-----------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------: |
|      ???       | [forumComment({required int commentId})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/forumComment.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/19_forum_comment/response.json) |

From Forum Comment API, you can get forum comment related to the language you are currently learning and comment id.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final forumCommentResponse = await duolingo.forumComment(
    commentId: 1678438,
  );

  print(forumCommentResponse);

  for (final comment in forumCommentResponse.comments) {
    // This indicates a comment on a comment.
    print(comment);

    for (final nestedComment in comment.comments) {
      print(nestedComment);
    }
  }

  for (final dictionaryPath in forumCommentResponse.dictionaryPaths) {
    print(dictionaryPath.word);
    print(dictionaryPath.url);
  }
}
```

### 1.3.23. Search Friend API

| Auth Required |                                                                                 Method                                                                                  |                                                     JSON                                                      |
| :-----------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------: |
|      ???       | [searchFriend({required int page, required int perPage, required String query})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/searchFriend.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/21_search_friend/response.json) |

With Search Friend API, you can get search users registered on Duolingo by search word.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final response = await duolingo.searchFriend(
    page: 1,
    perPage: 20,
    query: 'test',
  );

  for (final user in response.users) {
    print(user);
  }
}
```

### 1.3.24. Recommendations API

| Auth Required |                                                                Method                                                                 |                                                      JSON                                                       |
| :-----------: | :-----------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------: |
|      ???       | [recommendations({required String userId})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/recommendations.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/22_recommendations/response.json) |

With Recommendations API, you can get recommended users on Duolingo.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final response = await duolingo.recommendations(userId: authResponse.userId);
  print(response);

  for (final recommendation in response.recommendations) {
    print(recommendation);
    print(recommendation.user);
  }
}
```

### 1.3.25. Search Forum API

| Auth Required |                                                                              Method                                                                               |                                                     JSON                                                     |
| :-----------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------: |
|      ???       | [searchForum({required int page, int perPage = 10, required String query})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/searchForum.html) | [Check!](https://github.com/duolingo4d/duolingo-api-design/tree/main/response/23_search_forum/response.json) |

With Search Forum API, you can search forums on Duolingo.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final response = await duolingo.searchForum(
    page: 1,
    perPage: 20,
    query: 'test',
  );

  print(response);

  for (final forum in response.forums) {
    print(forum);
  }
}
```

## 1.4. License

```license
Copyright (c) 2021, Kato Shinya. All rights reserved.
Use of this source code is governed by a
BSD-style license that can be found in the LICENSE file.
```

## 1.5. More Information

`Duolingo4D` was designed and implemented by **_Kato Shinya_**.

- [Creator Profile](https://github.com/myConsciousness)
- [License](https://github.com/myConsciousness/duolingo4d/blob/main/LICENSE)
- [API Document](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/duolingo4d-library.html)
- [Release Note](https://github.com/myConsciousness/duolingo4d/releases)
- [Bug Report](https://github.com/myConsciousness/duolingo4d/issues)
