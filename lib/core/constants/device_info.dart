import 'dart:io';
import 'package:device_info/device_info.dart';

class DeviceInfo {
  static Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceId = '';

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId; // Device ID for Android
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor; // Device ID for iOS
      }
    } catch (e) {
      print('Failed to get device ID: $e');
    }

    return deviceId;
  }
}
