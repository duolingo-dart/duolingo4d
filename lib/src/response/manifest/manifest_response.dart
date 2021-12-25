// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:duolingo4d/src/response/manifest/icon.dart';
import 'package:duolingo4d/src/response/response.dart';
import 'package:duolingo4d/src/response/status.dart';

export 'package:duolingo4d/src/response/manifest/icon.dart';

class ManifestResponse extends Response {
  /// Returns the new instance of [ManifestResponse] based on arguments.
  ManifestResponse.from({
    required int statusCode,
    required String reasonPhrase,
    required Map<String, String> headers,
    required this.name,
    required this.icons,
    required this.backgroundColor,
    required this.themeColor,
  }) : super.from(
          status: Status.from(
            code: statusCode,
            reasonPhrase: reasonPhrase,
          ),
          headers: headers,
        );

  /// The name
  final String name;

  /// The icons
  final List<Icon> icons;

  /// The background color
  final String backgroundColor;

  /// The theme color
  final String themeColor;

  @override
  String toString() {
    return 'ManifestResponse(name: $name, icons: $icons, backgroundColor: $backgroundColor, themeColor: $themeColor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ManifestResponse &&
        other.name == name &&
        listEquals(other.icons, icons) &&
        other.backgroundColor == backgroundColor &&
        other.themeColor == themeColor;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        icons.hashCode ^
        backgroundColor.hashCode ^
        themeColor.hashCode;
  }
}
