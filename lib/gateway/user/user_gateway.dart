import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:geister/gateway/firebase/firebase_firestore.dart';
import 'package:geister/gateway/firebase/firebase_functions.dart';
import 'package:geister/presenter/user/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserGateway {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseFunctions firebaseFunctions;
  const UserGateway({
    required this.firebaseFirestore,
    required this.firebaseFunctions,
  });

  Future<User> createUser(String userName) async {
    if (userName.isEmpty) throw Exception('userName is empty');

    final callable = firebaseFunctions.httpsCallable('createUser');
    final result = await callable.call(<String, dynamic>{
      'userName': userName,
    });

    return User.fromJson({
      'id': result.data,
      'user_name': userName,
    });
  }

  Future<User> getUser(String userId) async {
    final result =
        await firebaseFirestore.collection('users').doc(userId).get();
    if (!result.exists) throw Exception('user not found');

    return User.fromJson({
      'id': userId,
      'user_name': result.data()!['user_name'],
    });
  }
}

final userGatewayProvider = Provider<UserGateway>(
  (ref) => UserGateway(
    firebaseFirestore: ref.watch(firebaseFirestoreProvider),
    firebaseFunctions: ref.watch(firebaseFunctionsProvider),
  ),
);
