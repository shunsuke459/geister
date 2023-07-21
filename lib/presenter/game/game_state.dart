import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required String keyWord,
    required bool isMatched,
    required bool isSearching,
    @Default(0) int readyNum,
    required String myId,
    String? opponentId,
  }) = _GameState;
}
