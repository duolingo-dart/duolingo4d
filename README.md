![duolingo4d](https://user-images.githubusercontent.com/13072231/144712046-e495a2d4-4167-4d9b-8865-330d8aa54f90.png)

**_A most easily usable Duolingo API wrapper in Dart!_**

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
    - [1.3.1. Version Info API](#131-version-info-api)
    - [1.3.2. Authentication API](#132-authentication-api)
    - [1.3.3. User API](#133-user-api)
    - [1.3.4. Overview API](#134-overview-api)
    - [1.3.5. Word Hint API](#135-word-hint-api)
    - [1.3.6. Switch Language API](#136-switch-language-api)
    - [1.3.7. Leaderboard API](#137-leaderboard-api)
  - [1.4. License](#14-license)
  - [1.5. More Information](#15-more-information)

<!-- /TOC -->

# 1. About

`Duolingo4D` is an open-sourced Dart library.</br>
With `Duolingo4D`, you can easily integrate your application with the Duolingo API.

`Duolingo4D` is an unofficial library.

## 1.1. Supported Duolingo API

| Name            | Auth Required | Remarks                                                                                |
| :-------------- | :-----------: | :------------------------------------------------------------------------------------- |
| Version Info    |      ❌       | You can fetch metadata about the various configurations of services in Duolingo.       |
| Authentication  |      ❌       | Authenticate user by using Duolingo registered username or email address and password. |
| User            |      ✅       | You can fetch detailed user information.                                               |
| Overview        |      ✅       | You can fetch information on all the words user have learned in Duolingo.              |
| Word Hint       |      ✅       | You can fetch hint information about words and sentences.                              |
| Switch Language |      ✅       | You can switch the learning language.                                                  |
| Leaderboard     |      ✅       | You can get the leaderboards of you and your friends in a ranking format.              |

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

### 1.3.1. Version Info API

| Auth Required |                                                Method                                                 |                                                     JSON                                                      |
| :-----------: | :---------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------: |
|      ❌       | [versionInfo()](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/versionInfo.html) | [Check!](https://github.com/myConsciousness/duolingo4d/blob/main/design/00_api/01_version_info/response.json) |

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

### 1.3.2. Authentication API

| Auth Required |                                                                           Method                                                                            |                                                      JSON                                                      |
| :-----------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------: |
|      ❌       | [authenticate({required String username, required String password})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/authenticate.html) | [Check!](https://github.com/myConsciousness/duolingo4d/blob/main/design/00_api/02_login/response_success.json) |

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

### 1.3.3. User API

| Auth Required |                                                     Method                                                      |                                                  JSON                                                  |
| :-----------: | :-------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------: |
|      ✅       | [user({required String userId})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/user.html) | [Check!](https://github.com/myConsciousness/duolingo4d/blob/main/design/00_api/03_users/response.json) |

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

  for (final skill in userResponse.currentCourse.skills) {
    if (skill.isAccessible) {
      print(skill.name);
      print(skill.proficiency);
      print(skill.tipsAndNotes);
    }
  }
}
```

### 1.3.4. Overview API

| Auth Required |                                             Method                                              |                                                   JSON                                                    |
| :-----------: | :---------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------: |
|      ✅       | [overview()](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/overview.html) | [Check!](https://github.com/myConsciousness/duolingo4d/blob/main/design/00_api/04_overview/response.json) |

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

### 1.3.5. Word Hint API

| Auth Required |                                                                                          Method                                                                                           |                                                   JSON                                                    |
| :-----------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------: |
|      ❌       | [wordHint({required String fromLanguage, required String learningLanguage, required String sentence})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/wordHint.html) | [Check!](https://github.com/myConsciousness/duolingo4d/blob/main/design/00_api/05_hints/response_ja.json) |

You can fetch hint information for any word or sentence from the Word Hint API. Since the hint information is hint data managed by Duolingo, the accuracy of the translation data cannot be guaranteed.

The argument `learningLanguage` should be the language code corresponding to the word, and `fromLanguage` should be the language code corresponding to the hint. The `sentence` can be sentences as well as single words.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final wordHintResponse = await duolingo.wordHint(
    fromLanguage: 'en',
    learningLanguage: 'es',
    sentence: 'bolígrafos',
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
}
```

### 1.3.6. Switch Language API

| Auth Required |                                                                                   Method                                                                                    |
| :-----------: | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
|      ✅       | [switchLanguage({required String fromLanguage, required String learningLanguage})](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/switchLanguage.html) |

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

### 1.3.7. Leaderboard API

| Auth Required |                                                Method                                                 |                                                     JSON                                                     |
| :-----------: | :---------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------: |
|      ✅       | [leaderboard()](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Duolingo/leaderboard.html) | [Check!](https://github.com/myConsciousness/duolingo4d/blob/main/design/00_api/05_leaderboard/response.json) |

The Leaderboard API allows you to get information about your ranking with friends who are following you on Duolingo. The [Ranking](https://pub.dev/documentation/duolingo4d/latest/duolingo4d/Ranking-class.html) provides the feature to sort in ascending or descending order by score item.

```dart
void main() async {
  final duolingo = Duolingo.instance;

  final authResponse = await duolingo.authenticate(
    username: 'test_username',
    password: 'test_password',
  );

  final leaderboardResponse = await duolingo.leaderboard();

  print(leaderboardResponse.ranking);
  print(leaderboardResponse.userIds);

  final ranking = leaderboardResponse.ranking;

  // You can order ranking by score item.
  print(ranking.orderByScoreNameDesc());
  print(ranking.orderByScoreXpDesc());

  for (final score in ranking.scores) {
    print(score.userId);
    print(score.xp);
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
