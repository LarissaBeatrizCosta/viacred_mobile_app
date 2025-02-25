// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBBzEljlQIN-8f4YvGGhZzxnsFrtsuHwRU',
    appId: '1:92652438405:web:faf1de5654756e3e277aec',
    messagingSenderId: '92652438405',
    projectId: 'viacred-62ff6',
    authDomain: 'viacred-62ff6.firebaseapp.com',
    storageBucket: 'viacred-62ff6.firebasestorage.app',
    measurementId: 'G-0M45C0R4NY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBaLfOify6rO2yAxMN2qGW-bctZ3CjsUBw',
    appId: '1:92652438405:android:b9022e25e65cda84277aec',
    messagingSenderId: '92652438405',
    projectId: 'viacred-62ff6',
    storageBucket: 'viacred-62ff6.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5nTg0mUEr0Een6GYpDSSjhYPKkV4DBYU',
    appId: '1:92652438405:ios:0ea9fe54cb884051277aec',
    messagingSenderId: '92652438405',
    projectId: 'viacred-62ff6',
    storageBucket: 'viacred-62ff6.firebasestorage.app',
    iosBundleId: 'com.example.viacredApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBBzEljlQIN-8f4YvGGhZzxnsFrtsuHwRU',
    appId: '1:92652438405:web:5efa6c257b712ff9277aec',
    messagingSenderId: '92652438405',
    projectId: 'viacred-62ff6',
    authDomain: 'viacred-62ff6.firebaseapp.com',
    storageBucket: 'viacred-62ff6.firebasestorage.app',
    measurementId: 'G-0X3G0KZ0JN',
  );
}
