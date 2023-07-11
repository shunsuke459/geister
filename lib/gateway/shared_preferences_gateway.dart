import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesGateway {
  Future<bool> setString(String key, String value) async {
    final refs = await SharedPreferences.getInstance();
    return await refs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final refs = await SharedPreferences.getInstance();
    return refs.getString(key);
  }
}

final sharedPreferencesGatewayProvider =
    Provider<SharedPreferencesGateway>((ref) {
  return SharedPreferencesGateway();
});
