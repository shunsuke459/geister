import 'package:geister/gateway/shared_preferences_gateway.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SharedPreferencesPresenter {
  final SharedPreferencesGateway sharedPreferencesGateway;
  SharedPreferencesPresenter({required this.sharedPreferencesGateway});

  Future<bool> setUserName(String userName) async {
    return await sharedPreferencesGateway.setString('userName', userName);
  }

  Future<String> getUserName() async {
    return await sharedPreferencesGateway.getString('userName') ?? '';
  }

  Future<bool> deleteUserName() async {
    return await sharedPreferencesGateway.setString('userName', '');
  }

  Future<bool> needSignUp() async {
    final userName = await sharedPreferencesGateway.getString('userName');

    return userName == null || userName.isEmpty;
  }
}

final sharedPreferencesPresenterProvider =
    Provider<SharedPreferencesPresenter>((ref) {
  final sharedPreferencesGateway = ref.watch(sharedPreferencesGatewayProvider);

  return SharedPreferencesPresenter(
    sharedPreferencesGateway: sharedPreferencesGateway,
  );
});
