import 'package:flutter/material.dart';
import 'package:geister/page/widget/app_icon.dart';
import 'package:geister/presenter/shared_preferences/shared_preferences_presenter.dart';
import 'package:geister/presenter/user/user_presenter.dart';
import 'package:geister/router/route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // スプラッシュ画面を2秒表示
      await Future.delayed(const Duration(seconds: 2));

      final bool needSignUp =
          await ref.watch(sharedPreferencesPresenterProvider).needSignUp();
      if (needSignUp) {
        SignUpPageRoute().go(context);
      } else {
        final userId = await ref
            .watch(sharedPreferencesPresenterProvider)
            .getText('userId');
        await ref.read(userPresenterProvider.notifier).getUser(userId);

        HomePageRoute().go(context);
      }
    });

    return const Scaffold(
      body: Center(
        child: AppIcon(),
      ),
    );
  }
}
