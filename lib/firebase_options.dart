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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBpQhnM_E4kIBc3BXK0ELK1KcLgsEGcmrA',
    appId: '1:132958929461:web:31ee2f156d9977598ee77c',
    messagingSenderId: '132958929461',
    projectId: 'imwell-3cc66',
    authDomain: 'imwell-3cc66.firebaseapp.com',
    storageBucket: 'imwell-3cc66.appspot.com',
    measurementId: 'G-FXK8DFECXC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMpzm9S7S4Gf9H1CWSUgJEk90QtwnS60Y',
    appId: '1:132958929461:android:07ce71747bb23d908ee77c',
    messagingSenderId: '132958929461',
    projectId: 'imwell-3cc66',
    storageBucket: 'imwell-3cc66.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB03kGSXWZ-EdVYydEWhwaogp4W1yP-2e8',
    appId: '1:132958929461:ios:a506f7b59c9262c28ee77c',
    messagingSenderId: '132958929461',
    projectId: 'imwell-3cc66',
    storageBucket: 'imwell-3cc66.appspot.com',
    iosClientId: '132958929461-tg2h1mkqe3820l1c307ammhjsi577v0c.apps.googleusercontent.com',
    iosBundleId: 'com.example.imwell',
  );
}