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
    apiKey: 'AIzaSyB3NF3oElmEhAaJngtbCbHVQlfvCan5JrA',
    appId: '1:27630119847:web:9e8ec5c7e36f5b1a7be482',
    messagingSenderId: '27630119847',
    projectId: 'aqua-app-fb6cc',
    authDomain: 'aqua-app-fb6cc.firebaseapp.com',
    storageBucket: 'aqua-app-fb6cc.appspot.com',
    measurementId: 'G-G7MX027X8L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCclqmcGat7Uf7iwMdTL4GMo4ELGyl4vKQ',
    appId: '1:27630119847:android:de700588df35993a7be482',
    messagingSenderId: '27630119847',
    projectId: 'aqua-app-fb6cc',
    storageBucket: 'aqua-app-fb6cc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAT7A9Vt4gQw68yxoF5fLH4Y0az5P0GCGU',
    appId: '1:27630119847:ios:fd56a67fa31d0d137be482',
    messagingSenderId: '27630119847',
    projectId: 'aqua-app-fb6cc',
    storageBucket: 'aqua-app-fb6cc.appspot.com',
    iosBundleId: 'com.example.aquaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAT7A9Vt4gQw68yxoF5fLH4Y0az5P0GCGU',
    appId: '1:27630119847:ios:fd56a67fa31d0d137be482',
    messagingSenderId: '27630119847',
    projectId: 'aqua-app-fb6cc',
    storageBucket: 'aqua-app-fb6cc.appspot.com',
    iosBundleId: 'com.example.aquaApp',
  );
}
