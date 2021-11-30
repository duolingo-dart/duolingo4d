# 1. Duolingo4D

**_A most easily usable Duolingo API wrapper in Dart!_**

`Duolingo4D` is an open-sourced Dart library.</br>
With `Duolingo4D`, you can easily integrate your application with the Duolingo API.</br>
`Duolingo4D` is an unofficial library.

<!-- TOC -->

- [1. Duolingo4D](#1-duolingo4d)
  - [1.1. Supported Duolingo API](#11-supported-duolingo-api)
  - [1.2. Using](#12-using)
    - [1.2.1. Install Library](#121-install-library)
    - [1.2.2. Import It](#122-import-it)
    - [Use Duolingo4D](#use-duolingo4d)
  - [1.3. License](#13-license)
  - [1.4. More Information](#14-more-information)

<!-- /TOC -->

## 1.1. Supported Duolingo API

| Name            | Authorization Required | Remarks                                                                                |
| :-------------- | :--------------------: | :------------------------------------------------------------------------------------- |
| Version Info    |           ☓            | You can fetch metadata about the various configurations of services in Duolingo.       |
| Login           |           ☓            | Authenticate user by using Duolingo registered username or email address and password. |
| User            |           ○            | You can fetch detailed user information.                                               |
| Overview        |           ○            | You can fetch information on all the words user have learned in Duolingo.              |
| Word Hint       |           ☓            | You can fetch hint information about words and sentences.                              |
| Switch Language |           ○            | You can switch the learning language.                                                  |

## 1.2. Using

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

### Use Duolingo4D

The easiest way to use it is to get a singleton instance from `DuolingoApi` and call each method.

All entity objects returned from the methods of `DuolingoApi` contain status codes and header information when HTTP communication is performed in internal processing.

For example, when performing the authentication process for a user, it will look like this:

```dart
final api = DuolingoApi.getInstance();

final authenticationResult = await api.authenticate(
    username: 'test_user',
    password: 'test_password',
);

if (authenticationResult.statusCode != 200) {
    // Client or Server error or something.
    authenticationResult.reasonPhrase;
    authenticationResult.headers;
    return;
}

if (authenticationResult.hasError) {
    // When there is an error on authentication.
    final authenticationError = authenticationResult.error!;
    print(authenticationError.code);
    print(authenticationError.reason);

    authenticationError.isInvalidUser; // Returns true if user is invalid.
    authenticationError.isInvalidPassword; // Returns true if password is invalid.
    return;
}
```

## 1.3. License

```license
Copyright (c) 2021, Kato Shinya. All rights reserved.
Use of this source code is governed by a
BSD-style license that can be found in the LICENSE file.
```

## 1.4. More Information

`Duolingo4D` was designed and implemented by Kato Shinya.

Regardless of the means or content of communication, I would love to hear from you if you have any questions or concerns. I do not check my email box very often so a response may be delayed, anyway thank you for your interest!

- [Creator Profile](https://github.com/myConsciousness)
- [License](https://github.com/myConsciousness/duolingo4d/blob/main/LICENSE)
- [Release Note](https://github.com/myConsciousness/duolingo4d/releases)
- [Bug Report](https://github.com/myConsciousness/duolingo4d/issues)
