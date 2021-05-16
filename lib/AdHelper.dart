import 'dart:io';

class AdHelper {

  //static get vs static function

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2047458434918452/8306755225';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-2047458434918452/8306755225';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get nativeTest {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2047458434918452/9456185363';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-2047458434918452/9456185363';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return '<YOUR_ANDROID_INTERSTITIAL_AD_UNIT_ID>';
    } else if (Platform.isIOS) {
      return '<YOUR_ANDROID_INTERSTITIAL_AD_UNIT_ID>';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}