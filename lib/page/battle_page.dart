import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geister/entity/arrow_type_enum.dart';
import 'package:geister/entity/piece_type_enum.dart';
import 'package:geister/entity/square_state.dart';
import 'package:geister/gen/assets.gen.dart';

class BattlePage extends HookWidget {
  const BattlePage({super.key});

  @override
  Widget build(BuildContext context) {
    const arrowTop = Icon(
      Icons.arrow_upward_rounded,
      color: Colors.black,
    );
    const arrowDown = Icon(
      Icons.arrow_downward_rounded,
      color: Colors.black,
    );

    final boardStateList = useState<List<List<SquareState>>>(
      List.generate(
        6,
        (row) => List.generate(
          6,
          (column) {
            final hasRedPiece = row == 4 && column >= 1 && column <= 4;
            final hasBluePiece = row == 5 && column >= 1 && column <= 4;
            final hasEnemyPiece =
                row >= 0 && row <= 1 && column >= 1 && column <= 4;
            final pieceIcon = hasRedPiece
                ? Assets.icons.allyRedIcon
                : hasBluePiece
                    ? Assets.icons.allyBlueIcon
                    : hasEnemyPiece
                        ? Assets.icons.enemyIcon
                        : '';

            return SquareState(
              row: row,
              column: column,
              pieceIcon: pieceIcon,
              pieceType: hasRedPiece
                  ? PieceTypeEnum.redGeister
                  : hasBluePiece
                      ? PieceTypeEnum.blueGeister
                      : hasEnemyPiece
                          ? PieceTypeEnum.enemyGeister
                          : PieceTypeEnum.empty,
              arrowType: ArrowTypeEnum.none,
            );
          },
        ),
      ),
    );

    final displayArrow = useState<bool>(false);
    final arrowCount = useState<int>(0);

    void hideArrow() {
      displayArrow.value = false;
      arrowCount.value = 0;

      boardStateList.value = boardStateList.value.map((pieceStateList) {
        return pieceStateList.map((pieceState) {
          return pieceState.copyWith(
            arrowIcon: '',
            arrowType: ArrowTypeEnum.none,
          );
        }).toList();
      }).toList();

      return;
    }

    void movePiece(int arrowRow, int arrowColumn) {
      displayArrow.value = false;
      arrowCount.value = 0;

      final arrow = boardStateList.value[arrowRow][arrowColumn].copyWith();
      switch (arrow.arrowType) {
        case ArrowTypeEnum.topArrow:
          final target = boardStateList.value[arrowRow + 1][arrowColumn];

          boardStateList.value = boardStateList.value.map((pieceStateList) {
            return pieceStateList.map((piece) {
              if (piece.row == arrowRow && piece.column == arrowColumn) {
                return piece.copyWith(
                  pieceIcon: target.pieceIcon,
                  pieceType: target.pieceType,
                  arrowIcon: '',
                  arrowType: ArrowTypeEnum.none,
                );
              }

              if (piece.row == target.row && piece.column == target.column) {
                return piece.copyWith(
                  pieceIcon: '',
                  pieceType: PieceTypeEnum.empty,
                  arrowIcon: '',
                  arrowType: ArrowTypeEnum.none,
                );
              }

              return piece;
            }).toList();
          }).toList();

          break;
        case ArrowTypeEnum.bottomArrow:
          final target = boardStateList.value[arrowRow - 1][arrowColumn];

          boardStateList.value = boardStateList.value.map((pieceStateList) {
            return pieceStateList.map((piece) {
              if (piece.row == arrowRow && piece.column == arrowColumn) {
                return piece.copyWith(
                  pieceIcon: target.pieceIcon,
                  pieceType: target.pieceType,
                  arrowIcon: '',
                  arrowType: ArrowTypeEnum.none,
                );
              }

              if (piece.row == target.row && piece.column == target.column) {
                return piece.copyWith(
                  pieceIcon: '',
                  pieceType: PieceTypeEnum.empty,
                  arrowIcon: '',
                  arrowType: ArrowTypeEnum.none,
                );
              }

              return piece;
            }).toList();
          }).toList();

          break;
        case ArrowTypeEnum.leftArrow:
          final target = boardStateList.value[arrowRow][arrowColumn + 1];

          boardStateList.value = boardStateList.value.map((pieceStateList) {
            return pieceStateList.map((piece) {
              if (piece.row == arrowRow && piece.column == arrowColumn) {
                return piece.copyWith(
                  pieceIcon: target.pieceIcon,
                  pieceType: target.pieceType,
                  arrowIcon: '',
                  arrowType: ArrowTypeEnum.none,
                );
              }

              if (piece.row == target.row && piece.column == target.column) {
                return piece.copyWith(
                  pieceIcon: '',
                  pieceType: PieceTypeEnum.empty,
                  arrowIcon: '',
                  arrowType: ArrowTypeEnum.none,
                );
              }

              return piece;
            }).toList();
          }).toList();

          break;
        case ArrowTypeEnum.rightArrow:
          final target = boardStateList.value[arrowRow][arrowColumn - 1];

          boardStateList.value = boardStateList.value.map((pieceStateList) {
            return pieceStateList.map((piece) {
              if (piece.row == arrowRow && piece.column == arrowColumn) {
                return piece.copyWith(
                  pieceIcon: target.pieceIcon,
                  pieceType: target.pieceType,
                  arrowIcon: '',
                  arrowType: ArrowTypeEnum.none,
                );
              }

              if (piece.row == target.row && piece.column == target.column) {
                return piece.copyWith(
                  pieceIcon: '',
                  pieceType: PieceTypeEnum.empty,
                  arrowIcon: '',
                  arrowType: ArrowTypeEnum.none,
                );
              }

              return piece;
            }).toList();
          }).toList();

          break;
        default:
          break;
      }

      hideArrow();
      return;
    }

    void showArrow(
      int row,
      int column,
    ) {
      boardStateList.value = boardStateList.value.map((pieceStateList) {
        return pieceStateList.map((pieceState) {
          if (pieceState.isLeftPiece(row, column) && pieceState.isEmpty()) {
            arrowCount.value++;

            return pieceState.copyWith(
              arrowIcon: Assets.icons.arrowLeft,
              arrowType: ArrowTypeEnum.leftArrow,
            );
          }

          if (pieceState.isRightPiece(row, column) && pieceState.isEmpty()) {
            arrowCount.value++;

            return pieceState.copyWith(
              arrowIcon: Assets.icons.arrowRight,
              arrowType: ArrowTypeEnum.rightArrow,
            );
          }

          if (pieceState.isTopPiece(row, column) && pieceState.isEmpty()) {
            arrowCount.value++;

            return pieceState.copyWith(
              arrowIcon: Assets.icons.arrowTop,
              arrowType: ArrowTypeEnum.topArrow,
            );
          }

          if (pieceState.isBottomPiece(row, column) && pieceState.isEmpty()) {
            arrowCount.value++;

            return pieceState.copyWith(
                arrowIcon: Assets.icons.arrowBottom,
                arrowType: ArrowTypeEnum.bottomArrow);
          }

          return pieceState;
        }).toList();
      }).toList();

      if (arrowCount.value > 0) displayArrow.value = true;

      return;
    }

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
                final boardState = boardStateList.value[row][column];
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
                            ? arrowTop
                            : isBottomCorner
                                ? arrowDown
                                : Container();

                return GestureDetector(
                  onTap: () {
                    if (!displayArrow.value && boardState.pieceType.isAllyPiece)
                      showArrow(row, column);
                    else if (boardState.arrowType != ArrowTypeEnum.none)
                      movePiece(row, column);
                    else
                      hideArrow();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right:
                            const BorderSide(color: Colors.black, width: 1.0),
                        bottom:
                            const BorderSide(color: Colors.black, width: 1.0),
                        top: index >= 0 && index <= 5
                            ? const BorderSide(color: Colors.black, width: 1.0)
                            : BorderSide.none,
                        left: index % 6 == 0
                            ? const BorderSide(color: Colors.black, width: 1.0)
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
