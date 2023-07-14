import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geister/entity/game_board.dart';

part 'game_board_state.freezed.dart';

@freezed
class GameBoardState with _$GameBoardState {
  const factory GameBoardState({
    required GameBoard boardStateList,
    @Default(false) bool displayArrow,
    @Default(0) int arrowCount,
  }) = _GameBoardState;
}
