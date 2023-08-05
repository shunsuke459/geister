import 'package:geister/gateway/game/game_record_gateway.dart';
import 'package:geister/page/game_record/presenter/game_record_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameRecordPresenter extends StateNotifier<AsyncValue<GameRecordState>> {
  final GameRecordGateway gateway;
  GameRecordPresenter({required this.gateway})
      : super(const AsyncValue.loading());

  Future<void> fetchGameRecordList(String userId) async {
    try {
      final gameRecordList = await gateway.fetchGameRecordList(userId);

      state = AsyncValue.data(GameRecordState(gameRecordList: gameRecordList));
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final gameRecordPresenterProvider =
    StateNotifierProvider<GameRecordPresenter, AsyncValue<GameRecordState>>(
        (ref) {
  return GameRecordPresenter(gateway: ref.read(gameRecordGatewayProvider));
});
