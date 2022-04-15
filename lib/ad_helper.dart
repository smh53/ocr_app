import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5489184296182299/5471544252';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5489184296182299/5471544252';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  // // test
  // static String get bannerAdUnitId {
  //   if (Platform.isAndroid) {
  //     return 'ca-app-pub-3940256099942544/6300978111';
  //   } else if (Platform.isIOS) {
  //     return 'ca-app-pub-3940256099942544/2934735716';
  //   } else {
  //     throw UnsupportedError('Unsupported platform');
  //   }
  // }

  static String get bannerAdUnitId2 {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5489184296182299/8154968795';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5489184296182299/8154968795';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

//   static String get interstitialAdUnitId {
//     if (Platform.isAndroid) {
//       return '<YOUR_ANDROID_INTERSTITIAL_AD_UNIT_ID>';
//     } else if (Platform.isIOS) {
//       return '<YOUR_IOS_INTERSTITIAL_AD_UNIT_ID>';
//     } else {
//       throw new UnsupportedError('Unsupported platform');
//     }
//   }

//   static String get rewardedAdUnitId {
//     if (Platform.isAndroid) {
//       return '<YOUR_ANDROID_INTERSTITIAL_AD_UNIT_ID>';
//     } else if (Platform.isIOS) {
//       return '<YOUR_IOS_INTERSTITIAL_AD_UNIT_ID>';
//     } else {
//       throw new UnsupportedError('Unsupported platform');
//     }
//   }
// }
}
