import 'package:flutter/material.dart';
import 'package:geister/presenter/game/game_presenter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchingPage extends ConsumerWidget {
  final String keyWord;
  const SearchingPage({Key? key, required this.keyWord}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(gamePresenterProvider.notifier).searchOpponent(keyWord);

    return const Scaffold(
      body: Center(
        child: Text('対戦相手を探しています...'),
      ),
    );
  }
}
