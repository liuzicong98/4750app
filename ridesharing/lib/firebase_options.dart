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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVJTku6nh1f5wFwI9buAk79JSiY-eCzAY',
    appId: '1:866583999518:android:ec7259a8e59fa917d12a0f',
    messagingSenderId: '866583999518',
    projectId: 'joincarpool-app',
    storageBucket: 'joincarpool-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9eR4MjGxzi6cx2sUYD1gCg-_fklki3_8',
    appId: '1:866583999518:ios:c0343fb8263195d3d12a0f',
    messagingSenderId: '866583999518',
    projectId: 'joincarpool-app',
    storageBucket: 'joincarpool-app.appspot.com',
    iosClientId: '866583999518-i98tac6j6dt8obicdqjebselh11es8av.apps.googleusercontent.com',
    iosBundleId: 'com.ridesharing.demo.ridesharing',
  );
}
