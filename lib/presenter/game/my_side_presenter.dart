import 'package:geister/presenter/game/my_side_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MySidePresenter extends StateNotifier<MySideState> {
  MySidePresenter() : super(const MySideState());

  void getOpponentSidePiece(bool isRedPiece) {
    state = state.copyWith(
      enemyRedPieceCount:
          isRedPiece ? state.enemyRedPieceCount + 1 : state.enemyRedPieceCount,
      enemyBluePieceCount: !isRedPiece
          ? state.enemyBluePieceCount + 1
          : state.enemyBluePieceCount,
    );
  }
}

final mySidePresenterProvider =
    StateNotifierProvider<MySidePresenter, MySideState>(
  (ref) => MySidePresenter(),
);
