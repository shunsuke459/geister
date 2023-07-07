import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geister/gen/assets.gen.dart';
import 'package:geister/page/presenter/shared_preferences_presenter.dart';
import 'package:geister/router/route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // スプラッシュ画面を2秒表示
      await Future.delayed(const Duration(seconds: 2));

      final bool needUserRegistration = await ref
          .watch(sharedPreferencesPresenterProvider)
          .needUserRegistration();
      if (needUserRegistration) {
        HomePageRoute().go(context);
      } else {
        if (!context.mounted) return;
        HomePageRoute().go(context);
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icons.geisterIcon,
              width: 100,
            ),
            const SizedBox(height: 16),
            const Text(
              'Geister',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
