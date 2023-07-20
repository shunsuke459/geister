import 'dart:async';

import 'package:geister/entity/arrow_type_enum.dart';
import 'package:geister/entity/game_board.dart';
import 'package:geister/entity/piece_type_enum.dart';
import 'package:geister/entity/square_state.dart';
import 'package:geister/gateway/game/game_gateway.dart';
import 'package:geister/gen/assets.gen.dart';
import 'package:geister/presenter/game/game_board_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameBoardPresenter extends StateNotifier<GameBoardState> {
  final GameGateway gameGateway;
  StreamSubscription? _subscription;

  GameBoardPresenter({required this.gameGateway})
      : super(
          GameBoardState(initialArrangement: _initialArrangement()),
        );

  static List<List<PieceTypeEnum>> _initialArrangement() {
    return List.generate(
        2, (index) => List.generate(4, (i) => PieceTypeEnum.empty));
  }

  void setPiece(int row, int column, PieceTypeEnum type) {
    state = state.copyWith(
      initialArrangement: state.initialArrangement..[row][column] = type,
    );
  }

  void removePiece(int row, int column) {
    state = state.copyWith(
      initialArrangement: state.initialArrangement
        ..[row][column] = PieceTypeEnum.empty,
    );
  }

  Future<void> settleInitialBoard(String userId, String keyWord) async {
    final List<List<String>> gameBoard = List.generate(
      6,
      (row) => List.generate(
        6,
        (column) {
          if (row >= 0 && row <= 1 && column >= 1 && column <= 4) {
            return PieceTypeEnum.enemyGeister.name;
          } else if (row >= 4 && row <= 5 && column >= 1 && column <= 4) {
            final initialRow = row - 4;
            final initialColumn = column - 1;

            return state
                    .initialArrangement[initialRow][initialColumn].isRedPiece
                ? PieceTypeEnum.redGeister.name
                : PieceTypeEnum.blueGeister.name;
          } else {
            return PieceTypeEnum.empty.name;
          }
        },
      ),
    );

    await gameGateway.setInitialBoard(userId, keyWord, gameBoard);

    _getBoardState(userId);
  }

  void _getBoardState(String userId) {
    _subscription = gameGateway.getBoardState(userId).listen((event) {
      int row = -1;
      int column = -1;
      int redCount = 0;
      int blueCount = 0;

      state = state.copyWith(
        isMyTurn: event.$1,
        boardStateList: GameBoard(
          gameBoard: event.$2.map((e) {
            row++;
            column = -1;
            return e.map((e) {
              column++;
              if (e == PieceTypeEnum.redGeister.name) {
                redCount++;
              } else if (e == PieceTypeEnum.blueGeister.name) {
                blueCount++;
              }

              return SquareState(
                row: row,
                column: column,
                pieceType: e == PieceTypeEnum.enemyGeister.name
                    ? PieceTypeEnum.enemyGeister
                    : e == PieceTypeEnum.redGeister.name
                        ? PieceTypeEnum.redGeister
                        : e == PieceTypeEnum.blueGeister.name
                            ? PieceTypeEnum.blueGeister
                            : PieceTypeEnum.empty,
                arrowType: ArrowTypeEnum.none,
              );
            }).toList();
          }).toList(),
        ),
        opponentGoaled: event.$3,
      );

      state = state.copyWith(
        redPieceCount: redCount,
        bluePieceCount: blueCount,
      );
    });
  }

  Future<String> movePiece(
    int arrowRow,
    int arrowColumn,
    String userId,
    String keyWord,
  ) async {
    if (state.boardStateList?.gameBoard == null) return '';

    final arrow =
        state.boardStateList!.gameBoard[arrowRow][arrowColumn].copyWith();

    state = state.copyWith(displayArrow: false);

    _movePiece(arrow);
    _hideArrow();

    return await _updateGameBoard(userId, keyWord, false);
  }

  void _movePiece(SquareState arrow) {
    late SquareState target;
    final arrowRow = arrow.row;
    final arrowColumn = arrow.column;

    switch (arrow.arrowType) {
      case ArrowTypeEnum.topArrow:
        target = state.boardStateList!.gameBoard[arrowRow + 1][arrowColumn];
        break;
      case ArrowTypeEnum.bottomArrow:
        target = state.boardStateList!.gameBoard[arrowRow - 1][arrowColumn];
        break;
      case ArrowTypeEnum.leftArrow:
        target = state.boardStateList!.gameBoard[arrowRow][arrowColumn + 1];
        break;
      case ArrowTypeEnum.rightArrow:
        target = state.boardStateList!.gameBoard[arrowRow][arrowColumn - 1];
        break;
      default:
        break;
    }

    state = state.copyWith(
      boardStateList: state.boardStateList!.copyWith(
        gameBoard: state.boardStateList!.gameBoard.map((pieceStateList) {
          return pieceStateList.map((piece) {
            if (piece.row == arrowRow && piece.column == arrowColumn) {
              return piece.copyWith(
                pieceType: target.pieceType,
                arrowIcon: '',
                arrowType: ArrowTypeEnum.none,
              );
            }

            if (piece.row == target.row && piece.column == target.column) {
              return piece.copyWith(
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

  Future<String> _updateGameBoard(
      String userId, String keyWord, bool goaled) async {
    if (state.boardStateList?.gameBoard == null) return '';

    final gameBoard =
        state.boardStateList!.gameBoard.map<List<String>>((value) {
      return value.map<String>((e) {
        return e.pieceType.name;
      }).toList();
    }).toList();
    return await gameGateway.updateBoardState(
        userId, keyWord, goaled, gameBoard);
  }

  void showArrow(int row, int column) {
    if (state.boardStateList?.gameBoard == null) return;

    int arrowCount = 0;

    state = state.copyWith(
      boardStateList: state.boardStateList!.copyWith(
        gameBoard: state.boardStateList!.gameBoard.map((pieceStateList) {
          return pieceStateList.map((pieceState) {
            if (!pieceState.canShowArrow) return pieceState;

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

    if (arrowCount > 0) state = state.copyWith(displayArrow: true);

    return;
  }

  void hideArrow() => _hideArrow();

  void _hideArrow() {
    if (state.boardStateList?.gameBoard == null) return;

    state = state.copyWith(
      displayArrow: false,
      boardStateList: GameBoard(
        gameBoard: state.boardStateList!.gameBoard.map((pieceStateList) {
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

  Future<void> goaled(
    int row,
    int column,
    String userId,
    String keyWord,
  ) async {
    if (state.boardStateList?.gameBoard == null) return;

    state = state.copyWith(
      displayArrow: false,
      bluePieceCount: state.bluePieceCount - 1,
      boardStateList: state.boardStateList!.copyWith(
        gameBoard: state.boardStateList!.gameBoard
          ..[row][column] = SquareState(
            row: row,
            column: column,
            pieceType: PieceTypeEnum.empty,
            arrowIcon: '',
            arrowType: ArrowTypeEnum.none,
          ),
      ),
    );

    await _updateGameBoard(userId, keyWord, true);
  }

  void gameFinished(String userId) {
    _subscription?.cancel();
    state = GameBoardState(initialArrangement: _initialArrangement());

    _deleteBoard(userId);
  }

  Future<bool> deleteBoard(String userId) async {
    return await _deleteBoard(userId);
  }

  Future<bool> _deleteBoard(String userId) async {
    return await gameGateway.deleteBoard(userId);
  }
}

final gameBoardPresenterProvider =
    StateNotifierProvider<GameBoardPresenter, GameBoardState>((ref) {
  return GameBoardPresenter(
    gameGateway: ref.watch(gameGatewayProvider),
  );
});
