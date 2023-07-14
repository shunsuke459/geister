import 'package:geister/gateway/user/shared_preferences_gateway.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SharedPreferencesPresenter {
  final SharedPreferencesGateway sharedPreferencesGateway;
  SharedPreferencesPresenter({required this.sharedPreferencesGateway});

  Future<bool> setUserId(String userId) async {
    return await sharedPreferencesGateway.setString('userId', userId);
  }

  Future<String> getUserId() async {
    return await _getUserId();
  }

  Future<String> _getUserId() async {
    return await sharedPreferencesGateway.getString('userId') ?? '';
  }

  Future<bool> deleteUserId() async {
    return await sharedPreferencesGateway.setString('userId', '');
  }

  Future<bool> needSignUp() async {
    final userName = await _getUserId();

    return userName.isEmpty;
  }
}

final sharedPreferencesPresenterProvider =
    Provider<SharedPreferencesPresenter>((ref) {
  final sharedPreferencesGateway = ref.watch(sharedPreferencesGatewayProvider);

  return SharedPreferencesPresenter(
    sharedPreferencesGateway: sharedPreferencesGateway,
  );
});
