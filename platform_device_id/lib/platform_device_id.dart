import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:android_id/android_id.dart';
import 'package:platform_device_id_platform_interface/platform_device_id_platform_interface.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/// Provides device id information.
class PlatformDeviceId {
  /// Information derived from `android`-`androidId` or `ios`-`identifierForVendor`
  static Future<String?> get getDeviceId async {
    String? deviceId;
    try {
      if (kIsWeb) {
        deviceId = await PlatformDeviceIdPlatform.instance.getDeviceId();
      } else if (Platform.isAndroid) {
        deviceId = await _androidIdPlugin.getId();
      } else if (Platform.isIOS) {
        deviceId = await _androidIdPlugin.getId();
      } else {
        deviceId = await PlatformDeviceIdPlatform.instance.getDeviceId();
      }
    } on PlatformException {
      deviceId = '';
    }
    return deviceId;
  }
}
