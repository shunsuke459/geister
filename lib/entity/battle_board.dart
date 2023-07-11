import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geister/entity/square_state.dart';

part 'battle_board.freezed.dart';

@freezed
class BattleBoard with _$BattleBoard {
  const factory BattleBoard({
    required List<List<SquareState>> battleBoard,
  }) = _BattleBoard;
}
