import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geister/presenter/game/game_presenter.dart';
import 'package:geister/router/route.dart';
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
            return const Center(
              child: Text('対戦相手が見つかりました！'),
            );
          } else {
            return const Center(
              child: Text('対戦相手を探しています...'),
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
