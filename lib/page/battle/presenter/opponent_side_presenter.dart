import 'package:geister/page/battle/presenter/opponent_side_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OpponentSidePresenter extends StateNotifier<OpponentSideState> {
  OpponentSidePresenter() : super(const OpponentSideState());

  void getMySidePiece(bool isRedPiece) {
    state = state.copyWith(
      allyRedPieceCount:
          isRedPiece ? state.allyRedPieceCount + 1 : state.allyRedPieceCount,
      allyBluePieceCount:
          !isRedPiece ? state.allyBluePieceCount + 1 : state.allyBluePieceCount,
    );
  }
}

final opponentSidePresenterProvider =
    StateNotifierProvider<OpponentSidePresenter, OpponentSideState>(
  (ref) => OpponentSidePresenter(),
);
