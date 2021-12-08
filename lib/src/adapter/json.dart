// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Dart imports:
import 'dart:convert';

import 'dart:typed_data';

/// It provides safe and convenient functions related to JSON handling.
class Json {
  /// Returns the new instance of [Json] from json map.
  Json.fromJsonMap({
    required Map<String, dynamic> value,
  }) : jsonResource = value;

  /// Returns the new instance of [Json] from json string.
  Json.fromJsonString({
    required String value,
  }) : jsonResource = jsonDecode(value);

  /// Returns the new instance of [Json] from raw bytes.
  Json.fromBytes({
    required Uint8List bytes,
  }) : jsonResource = jsonDecode(utf8.decode(bytes));

  /// The json
  final Map<String, dynamic> jsonResource;

  /// Returns the string value linked to the [key], otherwise [defaultValue].
  String getStringValue({
    required String key,
    String defaultValue = '',
  }) =>
      jsonResource[key] ?? defaultValue;

  /// Returns the int value linked to the [key], otherwise [defaultValue].
  int getIntValue({
    required String key,
    int defaultValue = -1,
  }) =>
      jsonResource[key] ?? defaultValue;

  /// Returns the double value linked to the [key], otherwise [defaultValue].
  double getDoubleValue({
    required String key,
    double defaultValue = -1.0,
  }) =>
      jsonResource[key] ?? defaultValue;

  /// Returns the bool value linked to the [key], otherwise [defaultValue].
  bool getBoolValue({
    required String key,
    bool defaultValue = false,
  }) =>
      jsonResource[key] ?? defaultValue;

  /// Returns the child json linked to the [key], otherwise empty json object.
  Json getJson({required String key}) {
    if (!containsKey(key: key)) {
      return Json.fromJsonMap(value: {});
    }

    final value = jsonResource[key];

    if (value is String) {
      return Json.fromJsonString(value: value);
    }

    return Json.fromJsonMap(value: value);
  }

  /// Returns the child json list linked to the [key], otherwise empty json list.
  List<Json> getJsonList({required String key}) {
    if (!containsKey(key: key)) {
      return [];
    }

    final jsonList = <Json>[];

    for (final json in jsonResource[key]) {
      if (json is List) {
        for (final childJson in json) {
          jsonList.add(
            Json.fromJsonMap(value: childJson),
          );
        }
      } else {
        jsonList.add(
          Json.fromJsonMap(value: json),
        );
      }
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

  /// Returns the int value list linked to the [key], otherwise empty list.
  List<int> getIntValues({required String key}) {
    if (!containsKey(key: key)) {
      return <int>[];
    }

    final values = <int>[];

    for (final value in jsonResource[key]) {
      values.add(value);
    }

    return values;
  }

  /// Returns true if json contains key linked to [key] passed as an argument.
  bool containsKey({required String key}) => jsonResource.containsKey(key);

  /// Returns the key set of this json object.
  Set<String> get keySet => jsonResource.keys.toSet();

  /// Returns true if this json object is empty, otherwise false.
  bool get isEmpty => jsonResource.isEmpty;

  /// Returns true if this json object is not empty, otherwise false.
  bool get isNotEmpty => jsonResource.isNotEmpty;

  @override
  String toString() => jsonResource.toString();
}
