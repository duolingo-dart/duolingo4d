// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:duolingo4d/src/json.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  _testFromJsonString();
  _testFromJsonMap();

  _testGetStringValue();
  _testGetIntValue();
  _testGetDoubleValue();
  _testGetBoolValue();
  _testGetStringValues();
  _testGetIntValues();

  _testWhenJsonIsNotEmpty();
  _testWhenJsonIsEmpty();
}

void _testFromJsonString() {
  test('Test fromJsonString.', () {
    final json = Json.fromJsonString(value: '{"test": true}');
    expect(json.getBoolValue(key: 'test'), true);
  });
}

void _testFromJsonMap() {
  test('Test fromJsonMap.', () {
    final json = Json.fromJsonMap(value: {"test": true});
    expect(json.getBoolValue(key: 'test'), true);
  });
}

void _testGetStringValue() {
  test('Test getStringValue.', () {
    final json = Json.fromJsonMap(value: {'test': 'success'});
    expect(json.isEmpty, false);
    expect(json.getStringValue(key: 'test'), 'success');
  });
}

void _testGetIntValue() {
  test('Test getIntValue.', () {
    final json = Json.fromJsonMap(value: {'test': 1});
    expect(json.isEmpty, false);
    expect(json.getIntValue(key: 'test'), 1);
  });
}

void _testGetDoubleValue() {
  test('Test getDoubleValue.', () {
    final json = Json.fromJsonMap(value: {'test': 1.0});
    expect(json.isEmpty, false);
    expect(json.getDoubleValue(key: 'test'), 1.0);
  });
}

void _testGetBoolValue() {
  test('Test getBoolValue.', () {
    final json = Json.fromJsonMap(value: {'test': true});
    expect(json.isEmpty, false);
    expect(json.getBoolValue(key: 'test'), true);
  });
}

void _testGetStringValues() {
  test('Test getStringValues.', () {
    final json = Json.fromJsonMap(value: {
      'test': ['example_1', 'example_2']
    });

    expect(json.isEmpty, false);
    expect(json.getStringValues(key: 'test'), ['example_1', 'example_2']);
  });
}

void _testGetIntValues() {
  test('Test getIntValues.', () {
    final json = Json.fromJsonMap(value: {
      'test': [0, 1]
    });

    expect(json.isEmpty, false);
    expect(json.getIntValues(key: 'test'), [0, 1]);
  });
}

void _testWhenJsonIsNotEmpty() {
  test('Test when JSON is not empty.', () {
    final json = Json.fromJsonString(value: '''
        {
            "strength_bars": 1,
            "infinitive": null,
            "normalized_string": "Chuang ",
            "pos": null,
            "last_practiced_ms": 1573347371000,
            "skill": "Home 1",
            "related_lexemes": ["example_a", "example_b"],
            "test_int_values": [1111, 2222],
            "last_practiced": "2019-11-10T00:56:11Z",
            "strength": 0.22,
            "skill_url_title": "Home-1",
            "gender": null,
            "id": "f763b975c30e465d48f3eccbbdd8843a",
            "lexeme_id": "f763b975c30e465d48f3eccbbdd8843a",
            "word_string": "窓",
            "test_bool": true
         }
      ''');

    expect(json.isEmpty, false);

    expect(json.getIntValue(key: 'strength_bars'), 1);
    expect(json.getStringValue(key: 'infinitive'), '');
    expect(json.getStringValue(key: 'normalized_string'), 'Chuang ');
    expect(json.getStringValue(key: 'pos'), '');
    expect(json.getIntValue(key: 'last_practiced_ms'), 1573347371000);
    expect(json.getStringValue(key: 'skill'), 'Home 1');
    expect(
      json.getStringValues(key: 'related_lexemes'),
      [
        "example_a",
        "example_b",
      ],
    );
    expect(json.getIntValues(key: 'test_int_values'), [1111, 2222]);
    expect(json.getStringValue(key: 'last_practiced'), '2019-11-10T00:56:11Z');
    expect(json.getDoubleValue(key: 'strength'), 0.22);
    expect(json.getStringValue(key: 'skill_url_title'), 'Home-1');
    expect(json.getStringValue(key: 'gender'), '');
    expect(
      json.getStringValue(key: 'id'),
      'f763b975c30e465d48f3eccbbdd8843a',
    );
    expect(
      json.getStringValue(key: 'lexeme_id'),
      'f763b975c30e465d48f3eccbbdd8843a',
    );
    expect(json.getStringValue(key: 'word_string'), '窓');
    expect(json.getBoolValue(key: 'test_bool'), true);
  });
}

void _testWhenJsonIsEmpty() {
  test('Test when JSON is empty.', () {
    final json = Json.fromJsonMap(value: {});
    expect(json.isEmpty, true);
  });
}
