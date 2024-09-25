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
        return macos;
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
    apiKey: 'AIzaSyBlmJDbYsPx5yWkZKP_LN28xvkjFQbDDZI',
    appId: '1:693676514757:web:9c979487b5fb1889987fac',
    messagingSenderId: '693676514757',
    projectId: 'dashboard-cli-9d665',
    authDomain: 'dashboard-cli-9d665.firebaseapp.com',
    storageBucket: 'dashboard-cli-9d665.appspot.com',
    measurementId: 'G-B37V1E5YQV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB79WcNsMmU6itnBKlo1kgsZH6X4pXXuJo',
    appId: '1:693676514757:android:3b1589080804b70a987fac',
    messagingSenderId: '693676514757',
    projectId: 'dashboard-cli-9d665',
    storageBucket: 'dashboard-cli-9d665.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDm7AYfT1W-Apoyqt_C6-24qJY01shElBw',
    appId: '1:693676514757:ios:c9f96a933983556a987fac',
    messagingSenderId: '693676514757',
    projectId: 'dashboard-cli-9d665',
    storageBucket: 'dashboard-cli-9d665.appspot.com',
    iosBundleId: 'com.example.crudSample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDm7AYfT1W-Apoyqt_C6-24qJY01shElBw',
    appId: '1:693676514757:ios:c9f96a933983556a987fac',
    messagingSenderId: '693676514757',
    projectId: 'dashboard-cli-9d665',
    storageBucket: 'dashboard-cli-9d665.appspot.com',
    iosBundleId: 'com.example.crudSample',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBlmJDbYsPx5yWkZKP_LN28xvkjFQbDDZI',
    appId: '1:693676514757:web:c91e655986b537a3987fac',
    messagingSenderId: '693676514757',
    projectId: 'dashboard-cli-9d665',
    authDomain: 'dashboard-cli-9d665.firebaseapp.com',
    storageBucket: 'dashboard-cli-9d665.appspot.com',
    measurementId: 'G-K7T3KW32MP',
  );
}