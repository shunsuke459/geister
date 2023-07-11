import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geister/entity/square_state.dart';

part 'game_board.freezed.dart';

@freezed
class GameBoard with _$GameBoard {
  const factory GameBoard({
    required List<List<SquareState>> gameBoard,
  }) = _GameBoard;
}
