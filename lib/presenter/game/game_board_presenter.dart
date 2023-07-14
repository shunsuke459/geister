import 'package:geister/entity/arrow_type_enum.dart';
import 'package:geister/entity/game_board.dart';
import 'package:geister/entity/piece_type_enum.dart';
import 'package:geister/entity/square_state.dart';
import 'package:geister/gen/assets.gen.dart';
import 'package:geister/presenter/game/game_board_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameBoardPresenter extends StateNotifier<GameBoardState> {
  GameBoardPresenter()
      : super(GameBoardState(boardStateList: _generateBoard()));

  static GameBoard _generateBoard() {
    final gameBoard = List.generate(
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
    );

    return GameBoard(gameBoard: gameBoard);
  }

  void movePiece(int arrowRow, int arrowColumn) {
    final arrow =
        state.boardStateList.gameBoard[arrowRow][arrowColumn].copyWith();

    state = state.copyWith(
      displayArrow: false,
      arrowCount: 0,
    );

    _movePiece(arrow);

    _hideArrow();
  }

  void _movePiece(SquareState arrow) {
    late SquareState target;
    final arrowRow = arrow.row;
    final arrowColumn = arrow.column;

    switch (arrow.arrowType) {
      case ArrowTypeEnum.topArrow:
        target = state.boardStateList.gameBoard[arrowRow + 1][arrowColumn];
        break;
      case ArrowTypeEnum.bottomArrow:
        target = state.boardStateList.gameBoard[arrowRow - 1][arrowColumn];
        break;
      case ArrowTypeEnum.leftArrow:
        target = state.boardStateList.gameBoard[arrowRow][arrowColumn + 1];
        break;
      case ArrowTypeEnum.rightArrow:
        target = state.boardStateList.gameBoard[arrowRow][arrowColumn - 1];
        break;
      default:
        break;
    }

    state = state.copyWith(
      boardStateList: state.boardStateList.copyWith(
        gameBoard: state.boardStateList.gameBoard.map((pieceStateList) {
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
        }).toList(),
      ),
    );
  }

  void showArrow(int row, int column) {
    int arrowCount = 0;

    state = state.copyWith(
      boardStateList: state.boardStateList.copyWith(
        gameBoard: state.boardStateList.gameBoard.map((pieceStateList) {
          return pieceStateList.map((pieceState) {
            if (!pieceState.canShowArrow()) return pieceState;

            if (pieceState.isLeftPiece(row, column)) {
              arrowCount++;

              return pieceState.copyWith(
                arrowIcon: Assets.icons.arrowLeft,
                arrowType: ArrowTypeEnum.leftArrow,
              );
            }

            if (pieceState.isRightPiece(row, column)) {
              arrowCount++;

              return pieceState.copyWith(
                arrowIcon: Assets.icons.arrowRight,
                arrowType: ArrowTypeEnum.rightArrow,
              );
            }

            if (pieceState.isTopPiece(row, column)) {
              arrowCount++;

              return pieceState.copyWith(
                arrowIcon: Assets.icons.arrowTop,
                arrowType: ArrowTypeEnum.topArrow,
              );
            }

            if (pieceState.isBottomPiece(row, column)) {
              arrowCount++;

              return pieceState.copyWith(
                arrowIcon: Assets.icons.arrowBottom,
                arrowType: ArrowTypeEnum.bottomArrow,
              );
            }

            return pieceState;
          }).toList();
        }).toList(),
      ),
    );

    if (arrowCount > 0)
      state = state.copyWith(
        displayArrow: true,
        arrowCount: arrowCount,
      );

    return;
  }

  void hideArrow() => _hideArrow();

  void _hideArrow() {
    state = state.copyWith(
      displayArrow: false,
      arrowCount: 0,
      boardStateList: GameBoard(
        gameBoard: state.boardStateList.gameBoard.map((pieceStateList) {
          return pieceStateList.map((pieceState) {
            return pieceState.copyWith(
              arrowIcon: '',
              arrowType: ArrowTypeEnum.none,
            );
          }).toList();
        }).toList(),
      ),
    );
  }
}

final gameBoardPresenterProvider =
    StateNotifierProvider<GameBoardPresenter, GameBoardState>((ref) {
  return GameBoardPresenter();
});
