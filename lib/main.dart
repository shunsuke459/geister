import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geister/firebase_options.dart';
import 'package:geister/page/battle/battle_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await initialize();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geister',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BattlePage(),
    );
  }
}
