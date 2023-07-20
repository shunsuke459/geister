import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geister/constants.dart';
import 'package:geister/entity/arrow_type_enum.dart';
import 'package:geister/entity/piece_type_enum.dart';
import 'package:geister/entity/square_state.dart';
import 'package:geister/gen/assets.gen.dart';
import 'package:geister/page/game/initial_arrangement_dialog.dart';
import 'package:geister/page/game/settled_game_dialog.dart';
import 'package:geister/presenter/game/game_board_presenter.dart';
import 'package:geister/presenter/game/game_presenter.dart';
import 'package:geister/presenter/user/user_presenter.dart';
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
        stolenRedPiece.value = 4 - gameBoardState.redPieceCount;
        stolenBluePiece.value = 4 - gameBoardState.bluePieceCount;

        if (stolenBluePiece.value == 4 || gameBoardState.opponentGoaled) {
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (gameState.value?.readyNum == 2)
                      Text(isMyTurn ? 'あなたのターンです' : '相手のターンです'),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            '獲られたガイスター',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF333333),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.icons.allyRedIcon,
                                      width: 30,
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      stolenRedPiece.value.toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Color(0xffdf5656),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.icons.allyBlueIcon,
                                      width: 30,
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      stolenBluePiece.value.toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Color(0xff3aabd2),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                      final boardState =
                          gameBoardState.boardStateList!.gameBoard[row][column];
                      final isTopCorner = index == 0 || index == 5;
                      final isBottomCorner = index == 30 || index == 35;
                      final piece = boardState.arrowIcon.isNotEmpty
                          ? SvgPicture.asset(
                              boardState.arrowIcon,
                              width: 42,
                            )
                          : boardState.pieceIcon.isNotEmpty
                              ? SvgPicture.asset(
                                  boardState.pieceIcon,
                                  width: 42,
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
                            final keyWord =
                                ref.watch(gamePresenterProvider).value?.keyWord;
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
                            } else if (stolePiece ==
                                PieceTypeEnum.blueGeister.name) {
                              stoleBluePiece.value++;
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
                              right: const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              bottom: const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              top: index >= 0 && index <= 5
                                  ? const BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    )
                                  : BorderSide.none,
                              left: index % 6 == 0
                                  ? const BorderSide(
                                      color: Colors.black,
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
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '獲ったガイスター',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.allyRedIcon,
                                  width: 30,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  stoleRedPiece.value.toString(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Color(0xffdf5656),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.allyBlueIcon,
                                  width: 30,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  stoleBluePiece.value.toString(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Color(0xff3aabd2),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if ((gameState.value?.readyNum ?? 0) < 2) ...[
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.5),
            ),
            const Center(
              child: Text(
                '対戦相手が初期配置を設定中です',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ],
      ),
    );
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
                  width: 42,
                )
              : Container(),
        ),
      ),
    );
  }
}
