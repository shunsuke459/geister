import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required bool isMatched,
    required String myId,
    required bool isSearching,
    String? opponentId,
  }) = _GameState;
}