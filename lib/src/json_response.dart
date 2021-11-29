// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

/// The class that represents response information composed by JSON.
class JsonResponse {
  /// Returns the new instance of [JsonResponse] from json map.
  JsonResponse.fromJsonMap({
    required Map<String, dynamic> value,
  }) : json = value;

  /// Returns the new instance of [JsonResponse] from json string.
  JsonResponse.fromJsonString({
    required String value,
  }) : json = jsonDecode(value);

  /// The json
  final Map<String, dynamic> json;

  /// Returns the string value linked to the [key], otherwise empty as a default.
  String getStringValue({required String key}) => json[key] ?? '';

  /// Returns the int value linked to the [key], otherwise 0 as a default.
  int getIntValue({required String key}) => json[key] ?? 0;

  /// Returns the double value linked to the [key], otherwise 0.0 as a default.
  double getDoubleValue({required String key}) => json[key] ?? 0.0;

  /// Returns the bool value linked to the [key], otherwise false as a default.
  bool getBoolValue({required String key}) => json[key] ?? false;

  /// Returns the value list linked to the [key], otherwise empty list.
  List<String> getValues({required String key}) {
    if (!containsKey(key: key)) {
      return <String>[];
    }

    final values = <String>[];

    for (final value in json[key]) {
      values.add(value);
    }

    return values;
  }

  /// Returns the child json string linked to the [key].
  JsonResponse childJsonString({required String key}) =>
      JsonResponse.fromJsonString(value: json[key]);

  /// Returns the child json map linked to the [key].
  JsonResponse childJsonMap({required String key}) =>
      JsonResponse.fromJsonMap(value: json[key]);

  /// Returns true if json contains key linked to [key] passed as an argument.
  bool containsKey({required String key}) => json.containsKey(key);

  /// Returns the key set of this json object.
  Set<String> get keySet => json.keys.toSet();
}
