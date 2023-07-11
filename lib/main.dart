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
}
