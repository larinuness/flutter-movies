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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKkTcCXbFyo3vSibBcL6LVONlRW_5P7MM',
    appId: '1:18622286589:android:f12a69bc19b4b6ec0c0c94',
    messagingSenderId: '18622286589',
    projectId: 'flutter-filmes-a0ef0',
    storageBucket: 'flutter-filmes-a0ef0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtY0c8D4lnn0TX7eLaRbsfNhvT1H3FOEU',
    appId: '1:18622286589:ios:b15ad548b0f922560c0c94',
    messagingSenderId: '18622286589',
    projectId: 'flutter-filmes-a0ef0',
    storageBucket: 'flutter-filmes-a0ef0.appspot.com',
    androidClientId: '18622286589-5j0rhvuup6m2et11dap1r2l4voi37hqr.apps.googleusercontent.com',
    iosClientId: '18622286589-8bgvifa218ibn1o1m006k21scl1tmmp3.apps.googleusercontent.com',
    iosBundleId: 'com.example.movies',
  );
}