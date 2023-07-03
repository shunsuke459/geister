import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geister/entity/battle_board.dart';

part 'battle_board_state.freezed.dart';

@freezed
class BattleBoardState with _$BattleBoardState {
  const factory BattleBoardState({
    required BattleBoard boardStateList,
    @Default(false) bool displayArrow,
    @Default(0) int arrowCount,
  }) = _BattleBoardState;
}
