import 'dart:io';
import 'package:flutter/foundation.dart';

class AppPlatform {
  static const Map<String, CustomPlatform> _platformMap = {
    'android': CustomPlatform.android,
    'macos': CustomPlatform.macos,
    'ios': CustomPlatform.ios,
    'fuchsia': CustomPlatform.fuchsia,
    'linux': CustomPlatform.linux,
    'windows': CustomPlatform.windows,
  };

  static CustomPlatform _getPlatform
      () {
    if (kIsWeb) {
      return CustomPlatform.web;
    }
    return _platformMap[Platform.operatingSystem] ?? CustomPlatform.undefined;
  }
  static CustomPlatform getPlatform =>_getPlatform();

  static bool get isMobile =>
      platform == CustomPlatform.ios || platform == CustomPlatform.android;
}

enum CustomPlatform {
  android,
  ios,
  fuchsia,
  macos,
  windows,
  linux,
  undefined,
  web,
}