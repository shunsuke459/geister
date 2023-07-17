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
      if (event.length == 2) {
        final opponentId =
            event.firstWhere((element) => element != state.value!.myId);
        state = AsyncValue.data(state.value!.copyWith(
          isMatched: true,
          opponentId: opponentId,
        ));
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

final gamePresenterProvider =
    StateNotifierProvider<GamePresenter, AsyncValue<GameState>>((ref) {
  return GamePresenter(
    gameGateway: ref.watch(gameGatewayProvider),
  );
});
