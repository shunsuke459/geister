import 'package:flutter/material.dart';
import 'package:geister/router/router.dart';
import 'package:geister/theme/app_theme_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Fantasmi',
      theme: ThemeData(
        scaffoldBackgroundColor: AppThemeColor.white.color,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppThemeColor.graySub.color,
        ),
        useMaterial3: true,
        fontFamily: 'Zen_Maru_Gothic',
      ),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
