import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geister/page/game_record/presenter/game_record_presenter.dart';
import 'package:geister/presenter/user/user_presenter.dart';
import 'package:geister/theme/app_text_style.dart';
import 'package:geister/theme/app_theme_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameRecordPage extends HookConsumerWidget {
  const GameRecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final userId = ref.watch(userPresenterProvider).value?.id;
        if (userId == null) return;

        ref
            .read(gameRecordPresenterProvider.notifier)
            .fetchGameRecordList(userId);
      });

      return () {};
    }, []);

    final asyncGameRecordState = ref.watch(gameRecordPresenterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '対戦成績',
          style: textStyle(
            AppTextStyle.titleRegular,
            AppThemeColor.black.color,
          ),
        ),
      ),
      body: asyncGameRecordState.when(
        data: (gameRecordState) {
          final gameRecordList = gameRecordState.gameRecordList;

          return Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Align(
              alignment: Alignment.topCenter,
              child: Table(
                defaultColumnWidth: const FractionColumnWidth(0.3),
                children: [
                  TableRow(
                    children: [
                      _header('対戦相手'),
                      _header('勝ち数'),
                      _header('負け数'),
                    ],
                  ),
                  ...gameRecordList.map((gameRecord) {
                    return TableRow(
                      children: [
                        _cell(gameRecord.opponentUserName),
                        _cell(gameRecord.winCount.toString()),
                        _cell(gameRecord.loseCount.toString()),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
          );
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

  Widget _header(String text) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: textStyle(
          AppTextStyle.titleBold,
          AppThemeColor.black.color,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _cell(String text) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: textStyle(
          AppTextStyle.bodyRegular,
          AppThemeColor.black.color,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
