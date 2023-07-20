import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geister/gen/assets.gen.dart';
import 'package:geister/presenter/shared_preferences/shared_preferences_presenter.dart';
import 'package:geister/presenter/user/user_presenter.dart';
import 'package:geister/router/route.dart';
import 'package:geister/theme/app_theme_color.dart';
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

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Random().nextBool()
                  ? Assets.icons.allyBlueIcon
                  : Assets.icons.allyRedIcon,
              width: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'G',
                  style: TextStyle(
                    fontSize: 64,
                    fontFamily: 'Cherry_Bomb_One',
                    color: AppThemeColor.stop.color,
                  ),
                ),
                Text(
                  'e',
                  style: TextStyle(
                    fontSize: 64,
                    fontFamily: 'Cherry_Bomb_One',
                    color: AppThemeColor.accentBlue.color,
                  ),
                ),
                Text(
                  'i',
                  style: TextStyle(
                    fontSize: 64,
                    fontFamily: 'Cherry_Bomb_One',
                    color: AppThemeColor.stop.color,
                  ),
                ),
                Text(
                  's',
                  style: TextStyle(
                    fontSize: 64,
                    fontFamily: 'Cherry_Bomb_One',
                    color: AppThemeColor.accentBlue.color,
                  ),
                ),
                Text(
                  't',
                  style: TextStyle(
                    fontSize: 64,
                    fontFamily: 'Cherry_Bomb_One',
                    color: AppThemeColor.stop.color,
                  ),
                ),
                Text(
                  'e',
                  style: TextStyle(
                    fontSize: 64,
                    fontFamily: 'Cherry_Bomb_One',
                    color: AppThemeColor.accentBlue.color,
                  ),
                ),
                Text(
                  'r',
                  style: TextStyle(
                    fontSize: 64,
                    fontFamily: 'Cherry_Bomb_One',
                    color: AppThemeColor.stop.color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
