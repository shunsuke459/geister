import 'dart:async';

import 'package:geister/gateway/game/game_gateway.dart';
import 'package:geister/presenter/game/game_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GamePresenter extends StateNotifier<AsyncValue<GameState>> {
  final GameGateway gameGateway;
  StreamSubscription? _subscription;

  GamePresenter({required this.gameGateway})
      : super(const AsyncValue.loading());

  Future<bool> createKeyWord(String userId, String keyWord) async {
    try {
      final isSuccess = await gameGateway.createKeyWord(
        userId: userId,
        keyWord: keyWord,
      );

      state = AsyncValue.data(
        GameState(
          keyWord: keyWord,
          isMatched: false,
          myId: userId,
          isSearching: false,
        ),
      );

      return isSuccess;
    } catch (_, __) {
      return false;
    }
  }

  void searchOpponent(String keyWord) {
    if (state.value == null) return;

    state = AsyncValue.data(state.value!.copyWith(isSearching: true));

    _subscription = gameGateway.searchOpponent(keyWord).listen((event) {
      state = AsyncValue.data(state.value!.copyWith(readyNum: event.$1));

      if (!state.value!.isMatched && event.$2.length == 2) {
        final opponentId =
            event.$2.firstWhere((element) => element != state.value!.myId);
        state = AsyncValue.data(state.value!.copyWith(
          isMatched: true,
          opponentId: opponentId,
        ));
      }
    });
  }

  void gameFinished() {
    _subscription?.cancel();
    state = const AsyncValue.loading();
  }

  Future<void> updateRecord(
    String userId,
    String keyWord,
    bool isWin,
  ) async {
    await gameGateway.updateRecord(userId, keyWord, isWin);
  }
}

final gamePresenterProvider =
    StateNotifierProvider<GamePresenter, AsyncValue<GameState>>((ref) {
  return GamePresenter(
    gameGateway: ref.watch(gameGatewayProvider),
  );
});
