import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geister/presenter/game/game_board_presenter.dart';
import 'package:geister/presenter/game/game_presenter.dart';
import 'package:geister/presenter/user/user_presenter.dart';
import 'package:geister/router/route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettledGameDialog extends HookConsumerWidget {
  final bool isWin;
  const SettledGameDialog({
    Key? key,
    required this.isWin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final userId = ref.watch(userPresenterProvider).value?.id;
        if (userId == null) return;
        final keyWord = ref.watch(gamePresenterProvider).value?.keyWord;
        if (keyWord == null) return;
        await ref
            .read(gamePresenterProvider.notifier)
            .updateRecord(userId, keyWord, isWin);

        ref.read(gamePresenterProvider.notifier).gameFinished();
        ref.read(gameBoardPresenterProvider.notifier).gameFinished(userId);
      });

      return () {};
    });

    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      title: Text(
        isWin ? '勝ちです' : '負けです',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
      ),
      content: ElevatedButton(
        onPressed: () {
          HomePageRoute().go(context);
        },
        child: const Text('ホームに戻る'),
      ),
    );
  }
}
