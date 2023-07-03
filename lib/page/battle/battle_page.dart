import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geister/constants.dart';
import 'package:geister/entity/arrow_type_enum.dart';
import 'package:geister/entity/piece_type_enum.dart';
import 'package:geister/page/battle/presenter/battle_board_presenter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BattlePage extends HookConsumerWidget {
  const BattlePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final battleBoardState = ref.watch(battleBoardPresenterProvider);
    final battleBoardPresenter =
        ref.read(battleBoardPresenterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Geister'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: 6 * 6,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
              ),
              itemBuilder: (context, index) {
                final column = index % 6;
                final row = index ~/ 6;
                final boardState =
                    battleBoardState.boardStateList.battleBoard[row][column];
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
                  onTap: () {
                    if (!battleBoardState.displayArrow &&
                        boardState.pieceType.isAllyPiece)
                      battleBoardPresenter.showArrow(row, column);
                    else if (boardState.arrowType != ArrowTypeEnum.none)
                      battleBoardPresenter.movePiece(row, column);
                    else
                      battleBoardPresenter.hideArrow();
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
        ),
      ),
    );
  }
}
