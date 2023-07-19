import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geister/entity/game_board.dart';
import 'package:geister/entity/piece_type_enum.dart';

part 'game_board_state.freezed.dart';

@freezed
class GameBoardState with _$GameBoardState {
  const factory GameBoardState({
    required List<List<PieceTypeEnum>> initialArrangement,
    GameBoard? boardStateList,
    @Default(false) bool displayArrow,
    @Default(false) bool isMyTurn,
    @Default(4) int redPieceCount,
    @Default(4) int bluePieceCount,
    @Default(false) bool opponentGoaled,
  }) = _GameBoardState;
}
