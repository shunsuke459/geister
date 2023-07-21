// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geister/firebase_options.dart';
import 'package:geister/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await _initialize();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ローカルでテストを行う際は以下を使用
  // FirebaseFunctions.instanceFor(region: 'asia-northeast1')
  //     .useFunctionsEmulator('127.0.0.1', 5001);
  // FirebaseFirestore.instance.useFirestoreEmulator('127.0.0.1', 8081);
}
