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
    apiKey: 'AIzaSyAoniDiGai1NswcTuiA6ILC6Iqban3n_rg',
    appId: '1:350526361598:web:e4a0d60148c219c414faaf',
    messagingSenderId: '350526361598',
    projectId: 'karbon-challenge',
    authDomain: 'karbon-challenge.firebaseapp.com',
    storageBucket: 'karbon-challenge.appspot.com',
    measurementId: 'G-5F8RHJ12XL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFcwBUoJyCL2iTGSL6tKkspg8ynMDLHbY',
    appId: '1:350526361598:android:f5c7fd85a460644c14faaf',
    messagingSenderId: '350526361598',
    projectId: 'karbon-challenge',
    storageBucket: 'karbon-challenge.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZw3K0O0gdS6tno60ZzZlTPm4qloNuaTg',
    appId: '1:350526361598:ios:3915d3ddfb16f2be14faaf',
    messagingSenderId: '350526361598',
    projectId: 'karbon-challenge',
    storageBucket: 'karbon-challenge.appspot.com',
    iosClientId: '350526361598-fgoli3dv78itju0ihackn9cfvvg17qbj.apps.googleusercontent.com',
    iosBundleId: 'com.example.challengeApp',
  );
}