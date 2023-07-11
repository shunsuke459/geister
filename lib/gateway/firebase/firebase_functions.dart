import 'package:cloud_functions/cloud_functions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseFunctionsProvider = Provider((ref) {
  return FirebaseFunctions.instanceFor(region: 'asia-northeast1');
});
