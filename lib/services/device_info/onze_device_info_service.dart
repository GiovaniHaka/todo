import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/services/device_info/domain/entities/device_info_entity.dart';

class OnzeDeviceInfoService {
  final _deviceInfoPlugin = DeviceInfoPlugin();

  late DeviceInfoEntity deviceInfo;

  OnzeDeviceInfoService();

  initialize() async {
    deviceInfo = await getDeviceInfo();
  }

  Future<DeviceInfoEntity> getDeviceInfo() async {
    try {
      const android = 'Android';
      const ios = 'iOS';

      if (kIsWeb) {
        final webInfo = await _deviceInfoPlugin.webBrowserInfo;

        return DeviceInfoEntity(
          deviceId: webInfo.vendor ?? '',
          deviceName: webInfo.browserName.name,
          deviceOs: webInfo.appVersion ?? 'web',
          osVersion: webInfo.userAgent ?? '',
        );
      }

      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfoPlugin.androidInfo;

        return DeviceInfoEntity(
          deviceId: androidInfo.fingerprint,
          deviceName: androidInfo.model,
          deviceOs: android,
          osVersion: androidInfo.version.release,
        );
      }

      if (Platform.isIOS) {
        final iosInfo = await _deviceInfoPlugin.iosInfo;

        return DeviceInfoEntity(
          deviceId: iosInfo.identifierForVendor ?? '',
          deviceName: iosInfo.name,
          deviceOs: ios,
          osVersion: iosInfo.systemVersion,
        );
      }

      throw UnimplementedError();
    } catch (e) {
      throw Exception(e);
    }
  }
}
