import 'package:geister/gateway/user/shared_preferences_gateway.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SharedPreferencesPresenter {
  final SharedPreferencesGateway sharedPreferencesGateway;
  SharedPreferencesPresenter({required this.sharedPreferencesGateway});

  Future<bool> setText(String key, String userId) async {
    return await sharedPreferencesGateway.setString(key, userId);
  }

  Future<String> getText(String key) async {
    return await _getText(key);
  }

  Future<String> _getText(String key) async {
    return await sharedPreferencesGateway.getString(key) ?? '';
  }

  Future<bool> deleteText(String key) async {
    return await sharedPreferencesGateway.setString(key, '');
  }

  Future<bool> needSignUp() async {
    final userName = await _getText('userId');

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
