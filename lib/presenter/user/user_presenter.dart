import 'package:geister/gateway/game/game_gateway.dart';
import 'package:geister/gateway/user/user_gateway.dart';
import 'package:geister/presenter/user/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserPresenter extends StateNotifier<AsyncValue<User>> {
  final UserGateway userGateway;
  final GameGateway gameGateway;

  UserPresenter({
    required this.userGateway,
    required this.gameGateway,
  }) : super(const AsyncValue.loading());

  Future<bool> createUser(String userName) async {
    state = const AsyncValue.loading();
    try {
      final result = await userGateway.createUser(userName);

      state = AsyncValue.data(result);

      return true;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);

      return false;
    }
  }

  Future<void> getUser(String userId) async {
    state = const AsyncValue.loading();
    try {
      final result = await userGateway.getUser(userId);

      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<bool> createKeyWord(String keyWord) async {
    try {
      final userId = state.value?.id;
      if (userId == null) throw Exception('userId is null');

      final isSuccess = await gameGateway.createKeyWord(
        userId: userId,
        keyWord: keyWord,
      );

      return isSuccess;
    } catch (_, __) {
      return false;
    }
  }
}

final userPresenterProvider =
    StateNotifierProvider<UserPresenter, AsyncValue<User>>(
  (ref) => UserPresenter(
    userGateway: ref.watch(userGatewayProvider),
    gameGateway: ref.watch(gameGatewayProvider),
  ),
);
