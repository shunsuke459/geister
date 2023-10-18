import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geister/constants.dart';
import 'package:geister/entity/piece_type_enum.dart';
import 'package:geister/entity/square_state.dart';
import 'package:geister/gen/assets.gen.dart';
import 'package:geister/page/game/initial_arrangement_dialog.dart';
import 'package:geister/page/game/settled_game_dialog.dart';
import 'package:geister/presenter/game/game_board_presenter.dart';
import 'package:geister/presenter/game/game_presenter.dart';
import 'package:geister/presenter/user/user_presenter.dart';
import 'package:geister/theme/app_text_style.dart';
import 'package:geister/theme/app_theme_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameBoardState = ref.watch(gameBoardPresenterProvider);
    final gameBoardPresenter = ref.read(gameBoardPresenterProvider.notifier);
    final stoleRedPiece = useState<int>(0);
    final stoleBluePiece = useState<int>(0);
    final stolenRedPiece = useState<int>(0);
    final stolenBluePiece = useState<int>(0);
    final showLeftGoalArrow = useState<bool>(false);
    final showRightGoalArrow = useState<bool>(false);
    final width = MediaQuery.of(context).size.width;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const InitialArrangementDialog(),
        );
      });

      return () {};
    }, []);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (stolenRedPiece.value < 4 - gameBoardState.redPieceCount) {
          stolenRedPiece.value = 4 - gameBoardState.redPieceCount;

          if (stolenRedPiece.value > 0)
            _autoDeleteDialog(
              context,
              () => _showStatusDialog(
                context,
                '赤のコマが獲られました',
                Assets.icons.allyRedIcon,
              ),
            );
        } else if (stolenBluePiece.value < 4 - gameBoardState.bluePieceCount) {
          stolenBluePiece.value = 4 - gameBoardState.bluePieceCount;

          if (stolenBluePiece.value > 0)
            _autoDeleteDialog(
              context,
              () => _showStatusDialog(
                context,
                '青のコマが獲られました',
                Assets.icons.allyBlueIcon,
              ),
            );
        }
        final isGoaled = gameBoardState.allyGoaled;

        if (!isGoaled &&
            (stolenBluePiece.value == 4 || gameBoardState.opponentGoaled)) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const SettledGameDialog(isWin: false),
          );
        } else if (stolenRedPiece.value == 4) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const SettledGameDialog(isWin: true),
          );
        }
      });

      return () {};
    }, [gameBoardState]);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (stoleBluePiece.value == 4) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const SettledGameDialog(isWin: true),
          );
        } else if (stoleRedPiece.value == 4) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const SettledGameDialog(isWin: false),
          );
        }
      });

      return () {};
    }, [stoleRedPiece.value, stoleBluePiece.value]);

    final gameState = ref.watch(gamePresenterProvider);
    final isMyTurn = gameBoardState.isMyTurn;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (gameState.value?.readyNum == 2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          isMyTurn ? 'あなた' : '相手',
                          style: textStyle(
                            AppTextStyle.bigBold,
                            isMyTurn
                                ? AppThemeColor.accentBlue.color
                                : AppThemeColor.stop.color,
                          ),
                        ),
                        Text(
                          'のターンです',
                          style: textStyle(
                            AppTextStyle.headlineBold,
                            AppThemeColor.black.color,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '獲った',
                                  style: textStyle(
                                    AppTextStyle.bodyBold,
                                    AppThemeColor.black.color,
                                  ),
                                ),
                                TextSpan(
                                  text: 'コマ',
                                  style: textStyle(
                                    AppTextStyle.bodyRegular,
                                    AppThemeColor.black.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    Assets.icons.allyRedIcon,
                                    width: (width / 4) * 0.3,
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    stoleRedPiece.value.toString(),
                                    style: textStyle(
                                      AppTextStyle.headlineBold,
                                      AppThemeColor.stop.color,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    Assets.icons.allyBlueIcon,
                                    width: (width / 4) * 0.3,
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    stoleBluePiece.value.toString(),
                                    style: textStyle(
                                      AppTextStyle.headlineBold,
                                      AppThemeColor.accentBlue.color,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '獲られた',
                                  style: textStyle(
                                    AppTextStyle.bodyBold,
                                    AppThemeColor.black.color,
                                  ),
                                ),
                                TextSpan(
                                  text: 'コマ',
                                  style: textStyle(
                                    AppTextStyle.bodyRegular,
                                    AppThemeColor.black.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.icons.allyRedIcon,
                                      width: (width / 4) * 0.3,
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      stolenRedPiece.value.toString(),
                                      style: textStyle(
                                        AppTextStyle.headlineBold,
                                        AppThemeColor.stop.color,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.icons.allyBlueIcon,
                                      width: (width / 4) * 0.3,
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      stolenBluePiece.value.toString(),
                                      style: textStyle(
                                        AppTextStyle.headlineBold,
                                        AppThemeColor.accentBlue.color,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (gameBoardState.boardStateList?.gameBoard != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _GoalArrow(
                          isLeft: true,
                          showGoalArrow: showLeftGoalArrow,
                        ),
                        _GoalArrow(
                          isLeft: false,
                          showGoalArrow: showRightGoalArrow,
                        ),
                      ],
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: 6 * 6,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                      ),
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        final column = index % 6;
                        final row = index ~/ 6;
                        final boardState = gameBoardState
                            .boardStateList!.gameBoard[row][column];
                        final isTopCorner = index == 0 || index == 5;
                        final isBottomCorner = index == 30 || index == 35;
                        final piece = boardState.arrowIcon.isNotEmpty
                            ? SvgPicture.asset(
                                boardState.arrowIcon,
                                width: (width / 4) * 0.4,
                              )
                            : boardState.pieceIcon.isNotEmpty
                                ? SvgPicture.asset(
                                    boardState.pieceIcon,
                                    width: (width / 4) * 0.4,
                                  )
                                : isTopCorner
                                    ? Constants.arrowTop
                                    : isBottomCorner
                                        ? Constants.arrowDown
                                        : Container();

                        return GestureDetector(
                          onTap: () async {
                            if (!isMyTurn) return;

                            if (!gameBoardState.displayArrow &&
                                boardState.pieceType.isAllyPiece) {
                              gameBoardPresenter.showArrow(row, column);

                              if (row == 0 &&
                                  column == 0 &&
                                  boardState.pieceType.isBluePiece) {
                                showLeftGoalArrow.value = true;
                              } else if (row == 0 &&
                                  column == 5 &&
                                  boardState.pieceType.isBluePiece) {
                                showRightGoalArrow.value = true;
                              }
                            } else if (boardState.isArrow) {
                              showLeftGoalArrow.value = false;
                              showRightGoalArrow.value = false;

                              final userId =
                                  ref.watch(userPresenterProvider).value?.id;
                              if (userId == null) return;
                              final keyWord = ref
                                  .watch(gamePresenterProvider)
                                  .value
                                  ?.keyWord;
                              if (keyWord == null) return;

                              final stolePiece =
                                  await gameBoardPresenter.movePiece(
                                row,
                                column,
                                userId,
                                keyWord,
                              );

                              if (stolePiece.isEmpty) return;

                              if (stolePiece == PieceTypeEnum.redGeister.name) {
                                stoleRedPiece.value++;

                                if (stoleRedPiece.value < 4)
                                  await _autoDeleteDialog(
                                    context,
                                    () => _showStatusDialog(
                                      context,
                                      '赤のコマを獲りました',
                                      Assets.icons.allyRedIcon,
                                    ),
                                  );
                              } else if (stolePiece ==
                                  PieceTypeEnum.blueGeister.name) {
                                stoleBluePiece.value++;

                                if (stoleBluePiece.value < 4)
                                  await _autoDeleteDialog(
                                    context,
                                    () => _showStatusDialog(
                                      context,
                                      '青のコマを獲りました',
                                      Assets.icons.allyBlueIcon,
                                    ),
                                  );
                              }
                            } else {
                              gameBoardPresenter.hideArrow();
                              showLeftGoalArrow.value = false;
                              showRightGoalArrow.value = false;
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: AppThemeColor.black.color,
                                  width: 1.0,
                                ),
                                bottom: BorderSide(
                                  color: AppThemeColor.black.color,
                                  width: 1.0,
                                ),
                                top: index >= 0 && index <= 5
                                    ? BorderSide(
                                        color: AppThemeColor.black.color,
                                        width: 1.0,
                                      )
                                    : BorderSide.none,
                                left: index % 6 == 0
                                    ? BorderSide(
                                        color: AppThemeColor.black.color,
                                        width: 1.0,
                                      )
                                    : BorderSide.none,
                              ),
                            ),
                            child: Center(
                              child: piece,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
            if ((gameState.value?.readyNum ?? 0) < 2) ...[
              Container(
                width: double.infinity,
                height: double.infinity,
                color: AppThemeColor.blackOpacity.color,
              ),
              Center(
                child: Text(
                  '対戦相手が初期配置を設定中です...',
                  style: textStyle(
                    AppTextStyle.bodyRegular,
                    AppThemeColor.white.color,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _showStatusDialog(
    BuildContext context,
    String text,
    String iconPath,
  ) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
            child: Text(
              text,
              style: textStyle(
                AppTextStyle.bodyRegular,
                AppThemeColor.grayMain.color,
              ),
            ),
          ),
          content: SvgPicture.asset(
            iconPath,
            width: 42,
          ),
        ),
      );

  Future<void> _autoDeleteDialog(
    BuildContext context,
    Future<void> Function() callback,
  ) async {
    final timer = Timer(
      const Duration(milliseconds: 1500),
      () {
        Navigator.pop(context);
      },
    );

    await callback();

    if (timer.isActive) timer.cancel();
  }
}

class _GoalArrow extends ConsumerWidget {
  final bool isLeft;
  final ValueNotifier<bool> showGoalArrow;
  const _GoalArrow({
    Key? key,
    required this.isLeft,
    required this.showGoalArrow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = (MediaQuery.of(context).size.width - 16) / 6;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () async {
        final userId = ref.watch(userPresenterProvider).value?.id;
        if (userId == null) return;
        final keyWord = ref.watch(gamePresenterProvider).value?.keyWord;
        if (keyWord == null) return;

        await ref
            .read(gameBoardPresenterProvider.notifier)
            .goaled(0, isLeft ? 0 : 5, userId, keyWord);

        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const SettledGameDialog(isWin: true),
        );
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Center(
          child: showGoalArrow.value
              ? SvgPicture.asset(
                  Assets.icons.arrowTop,
                  width: (width / 4) * 0.4,
                )
              : SvgPicture.asset(
                  Assets.icons.goalIcon,
                  width: (width / 4) * 0.4,
                  colorFilter: ColorFilter.mode(
                    AppThemeColor.accentYellow.color,
                    BlendMode.srcATop,
                  ),
                ),
        ),
      ),
    );
  }
}
