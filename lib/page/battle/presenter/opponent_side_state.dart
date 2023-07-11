import 'package:freezed_annotation/freezed_annotation.dart';

part 'opponent_side_state.freezed.dart';

@freezed
class OpponentSideState with _$OpponentSideState {
  const factory OpponentSideState({
    @Default(4) int allyRedPieceCount,
    @Default(4) int allyBluePieceCount,
    @Default(0) int enemyRedPieceCount,
    @Default(0) int enemyBluePieceCount,
  }) = _OpponentSideState;
}
