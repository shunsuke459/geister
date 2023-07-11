import 'package:geister/gateway/user/user_gateway.dart';
import 'package:geister/page/home/presenter/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserPresenter extends StateNotifier<AsyncValue<User>> {
  final UserGateway userGateway;
  UserPresenter({required this.userGateway})
      : super(const AsyncValue.loading());

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
}

final userPresenterProvider =
    StateNotifierProvider<UserPresenter, AsyncValue<User>>(
  (ref) => UserPresenter(
    userGateway: ref.watch(userGatewayProvider),
  ),
);
