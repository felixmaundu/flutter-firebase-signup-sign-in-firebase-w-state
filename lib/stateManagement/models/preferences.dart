import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

// add this before generating
part 'preferences.g.dart';

/// Re-generate them preferences.g.dart file with the following command:
/// flutter packages pub run build_runner build --delete-conflicting-outputs

//7:08

@JsonSerializable()
class Preferences {
  static const THEME_MODE_DEFAULT_VALUE = ThemeMode.system;

  @JsonKey(defaultValue: THEME_MODE_DEFAULT_VALUE)
  final ThemeMode themeMode;

  Preferences(this.themeMode);

  factory Preferences.defaultValues() {
    return Preferences(
      THEME_MODE_DEFAULT_VALUE,
    );
  }

  factory Preferences.fromJson(json) =>
      _$PreferencesFromJson(Map<String, dynamic>.from(json));

  Map<String, dynamic> toJson() => _$PreferencesToJson(this);

  @override
  int get hashCode => themeMode.hashCode;

  Preferences copyWith({
    ThemeMode? themeMode,
  }) {
    return Preferences(
      themeMode ?? this.themeMode,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Preferences && themeMode == other.themeMode);
  }

  @override
  String toString() {
    return "Preferences($themeMode)";
  }
}
