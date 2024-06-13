// ignore_for_file: avoid_dynamic_calls, comment_references

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension ContextX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;
  Orientation get orientation => mediaQuery.orientation;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  /// Get [ColorScheme] of the current [BuildContext].

  ShadTextTheme get textTheme => theme.textTheme;
  TextStyle get paragraph => textTheme.p;
  TextStyle get title => textTheme.large;
  TextStyle get head => textTheme.h3;
  TextStyle get header => textTheme.h1;
  TextStyle get desc => textTheme.muted;
  ShadThemeData get theme => ShadTheme.of(this);
  ShadColorScheme get colorScheme => theme.colorScheme;

  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
  void snackbar({required String message, required Color backgroundColor}) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(message),
      ),
    );
  }

  void push(String path) => Navigator.pushNamed(this, path);

  /// Know if the current [iOS] is IOS.
  /// ```dart
  /// context.isIOS
  /// ```
  /// Returns [true] if the current [iOS] is IOS, [false] otherwise.
  bool get isIOS => Platform.isIOS;

  /// Know if the current [Android] is IOS.
  /// ```dart
  /// context.isAndroid
  /// ```
  /// Returns [true] if the current [Android] is Android, [false] otherwise.
  bool get isAndroid => Platform.isAndroid;
}
