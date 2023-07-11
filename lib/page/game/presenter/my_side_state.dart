import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_side_state.freezed.dart';

@freezed
class MySideState with _$MySideState {
  const factory MySideState({
    @Default(4) int allyRedPieceCount,
    @Default(4) int allyBluePieceCount,
    @Default(0) int enemyRedPieceCount,
    @Default(0) int enemyBluePieceCount,
  }) = _MySideState;
}
