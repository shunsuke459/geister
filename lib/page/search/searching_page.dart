import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geister/presenter/game/game_presenter.dart';
import 'package:geister/presenter/user/user_presenter.dart';
import 'package:geister/router/route.dart';
import 'package:geister/theme/app_text_style.dart';
import 'package:geister/theme/app_theme_color.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchingPage extends HookConsumerWidget {
  final String keyWord;
  const SearchingPage({Key? key, required this.keyWord}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncGameState = ref.watch(gamePresenterProvider);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!(asyncGameState.value?.isSearching ?? false))
          ref.read(gamePresenterProvider.notifier).searchOpponent(keyWord);
        if (!(asyncGameState.value?.isMatched ?? false)) return;

        await Future.delayed(const Duration(seconds: 3));
        GamePageRoute().go(context);
      });

      return () {};
    }, [asyncGameState.value]);

    return Scaffold(
      body: asyncGameState.when(
        data: (gameState) {
          final isMatched = gameState.isMatched;

          if (isMatched) {
            return Center(
              child: Text(
                '対戦相手が見つかりました！',
                style: textStyle(
                  AppTextStyle.headlineBold,
                  AppThemeColor.black.color,
                ),
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    '対戦相手を探しています...',
                    textAlign: TextAlign.center,
                    style: textStyle(
                      AppTextStyle.headlineBold,
                      AppThemeColor.black.color,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    final userId = ref.read(userPresenterProvider).value?.id;
                    if (userId != null) {
                      ref
                          .read(gamePresenterProvider.notifier)
                          .deleteKeyWord(userId, keyWord);
                    }

                    GoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppThemeColor.accentBlue.color,
                  ),
                  child: Text(
                    'ホーム画面に戻る',
                    style: textStyle(
                      AppTextStyle.titleBold,
                      AppThemeColor.white.color,
                    ),
                  ),
                ),
              ],
            );
          }
        },
        error: (_, __) => const Center(
          child: Text('エラーが発生しました'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
