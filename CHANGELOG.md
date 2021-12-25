# Release Note

## 0.1.5

- Added a feature that references the Manifest API.
- Added a feature that references the Shop Items API.
- Added a feature to purchase items sold on Duolingo.
- Improved the processing when the status code of the response returned from the API is other than 200. If the HTTP status code is other than 200, an empty object will be returned.

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
