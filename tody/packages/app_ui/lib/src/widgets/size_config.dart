import 'dart:io' show Platform;
import 'dart:math';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';

class SizeConfig {
  static final double screenWidth =
      window.physicalSize.width / window.devicePixelRatio;
  static final double screenHeight =
      window.physicalSize.height / window.devicePixelRatio;

  // Baseline design dimensions (example: iPhone 14)
  static const double baseWidth = 390;
  static const double baseHeight = 844;

  // Checks (rough equivalents)
  static bool? _isTablet;
  static bool? _hasNotch;

  static Future<void> initDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();

    // crude tablet check (screen ratio heuristic)
    _isTablet =
        max(screenWidth, screenHeight) / min(screenWidth, screenHeight) < 1.6;

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.manufacturer.toLowerCase().contains("samsung")) {
        // do something special for Samsung devices
      }
      _hasNotch = false; // adjust with actual Android notch detection if needed
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      if (iosInfo.name.toLowerCase().contains("iphone")) {
        _hasNotch = screenHeight / screenWidth > 2;
      } else {
        _hasNotch = false;
      }
    } else {
      _hasNotch = false;
    }
  }

  static bool get isTablet => _isTablet ?? false;
  static bool get hasNotch => _hasNotch ?? false;
  static bool get isSmallDevice => screenWidth <= 360;

  // Horizontal scale (width-based)
  static double horizontalScale(double size) {
    final scale = screenWidth / baseWidth;
    return (size * scale).roundToDouble();
  }

  // Vertical scale (height-based)
  static double verticalScale(double size) {
    final scale = screenHeight / baseHeight;
    return (size * scale).roundToDouble();
  }

  // Moderate scale
  static double moderateScale(double size, {double factor = 0.5}) {
    final scale = screenWidth / baseWidth;
    return (size + (size * scale - size) * factor).roundToDouble();
  }

  // Font scaling with clamping
  static double scaleFontSize(
    double size, {
    double minFont = 10,
    double maxFont = 32,
  }) {
    final scale = screenWidth / baseWidth;
    final newSize = size * scale;
    final scaled =
        (newSize * window.devicePixelRatio).roundToDouble() /
        window.devicePixelRatio;
    return max(minFont, min(maxFont, scaled));
  }

  // Example usage adjustments for tablets
  static double responsiveSize(double size) {
    if (isTablet) return size * 1.2;
    if (isSmallDevice && !hasNotch) return size * 0.95;
    return size;
  }

  // Add init() alias for convenience
  // static Future<void> init() async {
  //   await initDeviceInfo();
  // }
}
