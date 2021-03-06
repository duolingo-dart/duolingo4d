# Release Note

## 1.3.0

### New Features

- By caching `userId`, `fromLanguage` and `learningLanguage` when authentication is completed, these arguments have been changed from required to optional in some API calls.

## 1.2.0

- Added a `prettify()` method to the `WordHintResponse` class to convert responses from the Word Hint API into a simpler structure.

## 1.1.1

- Fixed README.

## 1.1.0

- Added a feature that allows you to search forums.
- Added a feature that allows you to get forum comments.

## 1.0.0

- Added a feature that allows you to search users.
- Added a feature that allows you to get recommendations users.

## 0.4.1

- Fixed README.

## 0.4.0

### New Features

- Added a feature that allows you to get achievements information.
- Added a feature that allows you to get forum topics information.
- Added a feature that allows you to get forum topic information.
- Added a feature that allows you to get forum comments information.

### Destructive changes

- Deleted `Activity API` because it already doesn't work.

## 0.3.0

### New Features

- Added a feature that allows you to get alphabets information.
- Added a feature that allows you to get stories information.
- Added a feature that allows you to follow user.
- Added a feature that allows you to unfollow user.

### Destructive changes

- Changed the name of `Friends API` to `Subscriptions API`. Due to this change, there are some changes in the name of the response class, but the content of the response is unchanged.

## 0.2.0

### New Features

- Added a feature that allows you to get a Duolingo's manifest information.
- Added a feature that allows you to get a list of items sold on Duolingo.
- Added a feature to purchase items sold on Duolingo.
- Added a feature that allows you to get information about leaderboard on Duolingo.
- Improved the processing when the status code of the response returned from the API is other than 200. If the HTTP status code is other than 200, an empty object will be returned.

### Destructive changes

- In the course of analyzing the Duolingo API, it was determined that the name was inappropriate, so the name of `Leaderboard API` which was provided until version `0.1.4` has been changed to `Activity API`.

## 0.1.4

- Added a feature that references the Dictionary API.
- Added a feature that references the Friends API.

## 0.1.3

- The configuration file has been adjusted to support multiple platforms. No new features or specifications have been changed.

## 0.1.0

- Added a feature to get session about communication with the Duolingo API.
- Added a feature that references the Leaderboard API.
- Added the feature to keep the response returned from the Duolingo API as a cache and reuse this cached response object.

## 0.0.5

- Added `TrackingProperty` field to `UserRespone`.
- Added implementations for `toString`, `== operator`, and `hashCode` to all response objects.

## 0.0.4

- Added `languageString` field to `OverviewResponse`.

## 0.0.3

- Added a return type to the getter when get an instance of the `Duolingo` class.

## 0.0.2

- Improved documentation.
- Moved dependency packages that are not required at runtime to dev_dependencies.

## 0.0.1

- First release!
