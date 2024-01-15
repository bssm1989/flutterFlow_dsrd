import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD0OAt6GZYS5ohjR6e7n9AzzBb7nMMEFf8",
            authDomain: "test3-mvw81e.firebaseapp.com",
            projectId: "test3-mvw81e",
            storageBucket: "test3-mvw81e.appspot.com",
            messagingSenderId: "240308754530",
            appId: "1:240308754530:web:27ac1419b4e77afdbf593b"));
  } else {
    await Firebase.initializeApp();
  }
}
