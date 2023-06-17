// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAXUEUxA3-vaHA1qebNN2z4Vdr-9sao0GY',
    appId: '1:29954221794:web:dc4cb251fcaf3ad24fe0bb',
    messagingSenderId: '29954221794',
    projectId: 'gjur-16bc7',
    authDomain: 'gjur-16bc7.firebaseapp.com',
    storageBucket: 'gjur-16bc7.appspot.com',
    measurementId: 'G-VEVLD0TRHQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLVoLKoagXaOk-TRDk27d-CLSb0X8PPQc',
    appId: '1:29954221794:android:a32eed89119e2d4b4fe0bb',
    messagingSenderId: '29954221794',
    projectId: 'gjur-16bc7',
    storageBucket: 'gjur-16bc7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtF0dkmNElbCOqxb2bP6vFOO-u9dDKO6Y',
    appId: '1:29954221794:ios:df22c172352df83f4fe0bb',
    messagingSenderId: '29954221794',
    projectId: 'gjur-16bc7',
    storageBucket: 'gjur-16bc7.appspot.com',
    iosClientId: '29954221794-putooos8ag3lhmlguild8g0a4ecvfocf.apps.googleusercontent.com',
    iosBundleId: 'com.example.npj',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCtF0dkmNElbCOqxb2bP6vFOO-u9dDKO6Y',
    appId: '1:29954221794:ios:e1f81639d81e98ed4fe0bb',
    messagingSenderId: '29954221794',
    projectId: 'gjur-16bc7',
    storageBucket: 'gjur-16bc7.appspot.com',
    iosClientId: '29954221794-qf4hfojfaliljgjnuf6mtpdjheilsun2.apps.googleusercontent.com',
    iosBundleId: 'com.example.npj.RunnerTests',
  );
}
