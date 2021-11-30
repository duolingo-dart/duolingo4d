# 1. Duolingo4D

**_A most easily usable Duolingo API wrapper in Dart!_**

`Duolingo4D` is an open-sourced Dart library.</br>
With `Duolingo4D`, you can easily integrate your application with the Duolingo API.</br>
`Duolingo4D` is an unofficial library.

<!-- TOC -->

- [1. Duolingo4D](#1-duolingo4d)
  - [1.1. Supported Duolingo API](#11-supported-duolingo-api)
  - [1.2. Introduce](#12-introduce)
    - [1.2.1. Install Library](#121-install-library)
    - [1.2.2. Import It](#122-import-it)
    - [1.2.3. Use Duolingo4D](#123-use-duolingo4d)
  - [1.3. Using](#13-using)
    - [1.3.1. Version Info API](#131-version-info-api)
    - [Authentication API](#authentication-api)
    - [User API](#user-api)
  - [1.4. License](#14-license)
  - [1.5. More Information](#15-more-information)

<!-- /TOC -->

## 1.1. Supported Duolingo API

| Name            | Auth Required | Remarks                                                                                |
| :-------------- | :-----------: | :------------------------------------------------------------------------------------- |
| Version Info    |      ❌       | You can fetch metadata about the various configurations of services in Duolingo.       |
| Authentication  |      ❌       | Authenticate user by using Duolingo registered username or email address and password. |
| User            |      ✅       | You can fetch detailed user information.                                               |
| Overview        |      ✅       | You can fetch information on all the words user have learned in Duolingo.              |
| Word Hint       |      ❌       | You can fetch hint information about words and sentences.                              |
| Switch Language |      ✅       | You can switch the learning language.                                                  |

## 1.2. Introduce

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
  final duolingo = Duolingo.getInstance();

  final authResponse = await duolingo.authenticate(
      username: 'test_username',
      password: 'test_password',
  );

  if (authResponse.statusCode != 200) {
      // Client or Server error or something.
      authResponse.reasonPhrase;
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

| Auth Required |                           Snippet                            |
| :-----------: | :----------------------------------------------------------: |
|      ❌       | final response = await Duolingo.getInstance().versionInfo(); |

The Version Info API allows you to fetch metadata about the configuration of Duolingo services.</br>
This metadata includes the TTS data used to play back the audio of the words, as well as mapping information for the languages supported by Duolingo.

```dart
void main() async {
  final duolingo = Duolingo.getInstance();

  final versionInfoResponse = await duolingo.versionInfo();

  if (authResponse.statusCode != 200) {
      // Client or Server error or something.
      authResponse.reasonPhrase;
      authResponse.headers;
      return;
  }

  final ttsVoiceConfiguration = versionInfoResponse.ttsVoiceConfiguration;

  for (final voiceDirections in ttsVoiceConfiguration.voiceDirections) {
    print(voiceDirections.language);
    print(voiceDirections.voice);
  }
}
```

### Authentication API

| Auth Required |                                                      Snippet                                                       |
| :-----------: | :----------------------------------------------------------------------------------------------------------------: |
|      ❌       | final response = await Duolingo.getInstance().authenticate(username: 'test_username', password: 'test_password',); |

You can use your username and password to authenticate users registered with Duolingo. The registered e-mail address can be used for authentication in addition to the username.

In order to fetch the response you expect from each API that requires authentication, at first you need to use this authentication API to authenticate that the username and password entered are valid.

> **_Note:_**</br>
> When a user is authenticated, the cookie information and session information for the Duolingo service is managed internally by Duolingo4D, so there is no need to be aware of this information after calling the API.

```dart
void main() async {
  final duolingo = Duolingo.getInstance();

  final authResponse = await duolingo.authenticate(
      username: 'test_username',
      password: 'test_password',
  );

  if (authResponse.statusCode != 200) {
      // Client or Server error or something.
      authResponse.reasonPhrase;
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

### User API

| Auth Required |                                     Snippet                                      |
| :-----------: | :------------------------------------------------------------------------------: |
|      ✅       | final response = await Duolingo.getInstance().user(userId: authResponse.userId); |

From the User API, you can get detailed user information associated with the user ID.

The user ID is included in the response returned when the user authentication is completed. Please refer to the following implementation for details.

The user information also includes all the course information and skill information user have learned.

```dart
void main() async {
  final duolingo = Duolingo.getInstance();

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

  for (final skill in userResponse.skills) {
    print(skill.name);
    print(skill.proficiency);
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

`Duolingo4D` was designed and implemented by Kato Shinya.

Regardless of the means or content of communication, I would love to hear from you if you have any questions or concerns. I do not check my email box very often so a response may be delayed, anyway thank you for your interest!

- [Creator Profile](https://github.com/myConsciousness)
- [License](https://github.com/myConsciousness/duolingo4d/blob/main/LICENSE)
- [Release Note](https://github.com/myConsciousness/duolingo4d/releases)
- [Bug Report](https://github.com/myConsciousness/duolingo4d/issues)
