// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

/// The class that represents JSON.
class Json {
  /// Returns the new instance of [Json] from json map.
  Json.fromJsonMap({
    required Map<String, dynamic> value,
  }) : jsonResource = value;

  /// Returns the new instance of [Json] from json string.
  Json.fromJsonString({
    required String value,
  }) : jsonResource = jsonDecode(value);

  /// The json
  final Map<String, dynamic> jsonResource;

  /// Returns the string value linked to the [key], otherwise empty as a default.
  String getStringValue({required String key}) => jsonResource[key] ?? '';

  /// Returns the int value linked to the [key], otherwise 0 as a default.
  int getIntValue({required String key}) => jsonResource[key] ?? 0;

  /// Returns the double value linked to the [key], otherwise 0.0 as a default.
  double getDoubleValue({required String key}) => jsonResource[key] ?? 0.0;

  /// Returns the bool value linked to the [key], otherwise false as a default.
  bool getBoolValue({required String key}) => jsonResource[key] ?? false;

  List<Json> getJsonList({required String key}) {
    final jsonList = <Json>[];

    for (final json in jsonResource[key]) {
      jsonList.add(
        Json.fromJsonMap(value: json),
      );
    }

    return jsonList;
  }

  /// Returns the string value list linked to the [key], otherwise empty list.
  List<String> getStringValues({required String key}) {
    if (!containsKey(key: key)) {
      return <String>[];
    }

    final values = <String>[];

    for (final value in jsonResource[key]) {
      values.add(value);
    }

    return values;
  }

  /// Returns the child json string linked to the [key].
  Json childJsonString({required String key}) =>
      Json.fromJsonString(value: jsonResource[key]);

  /// Returns the child json map linked to the [key].
  Json childJsonMap({required String key}) =>
      Json.fromJsonMap(value: jsonResource[key]);

  /// Returns true if json contains key linked to [key] passed as an argument.
  bool containsKey({required String key}) => jsonResource.containsKey(key);

  /// Returns the key set of this json object.
  Set<String> get keySet => jsonResource.keys.toSet();
}
