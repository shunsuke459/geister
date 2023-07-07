import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesGateway {
  Future<String?> getString(String key) async {
    final refs = await SharedPreferences.getInstance();
    return refs.getString(key);
  }
}

final sharedPreferencesGatewayProvider =
    Provider<SharedPreferencesGateway>((ref) {
  return SharedPreferencesGateway();
});
