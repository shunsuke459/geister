import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:geister/entity/square_state.dart';
import 'package:geister/gateway/firebase/firebase_firestore.dart';
import 'package:geister/gateway/firebase/firebase_functions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameGateway {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseFunctions firebaseFunctions;
  const GameGateway({
    required this.firebaseFirestore,
    required this.firebaseFunctions,
  });

  Future<bool> createKeyWord({
    required String userId,
    required String keyWord,
  }) async {
    if (userId.isEmpty) throw Exception('userId is empty');
    if (keyWord.isEmpty) throw Exception('keyWord is empty');

    final callable = firebaseFunctions.httpsCallable('createKeyWord');
    final result = await callable.call(<String, dynamic>{
      'userId': userId,
      'keyWord': keyWord,
    });

    return result.data as bool;
  }

  Future<bool> setInitialBoard(
    String userId,
    String keyWord,
    List<List<SquareState>> gameBoard,
  ) async {
    final callable = firebaseFunctions.httpsCallable('setInitialBoard');
    final result = await callable.call(<String, dynamic>{
      'userId': userId,
      'keyWord': keyWord,
      'boardState': gameBoard
          .map((event) => event.map((e) => e.pieceType.name).toList())
          .toList(),
    });

    return result.data as bool;
  }

  Stream<(int readyNum, List<String> userIdList)> searchOpponent(
      String keyWord) {
    return firebaseFirestore
        .collection('key_words')
        .doc(keyWord)
        .snapshots()
        .map((event) {
      final readyNum = event.data()?['ready_num'] as int;
      final userIdList = event.data()?['users'] as List<dynamic>;

      return (readyNum, userIdList.map<String>((e) => e.toString()).toList());
    });
  }
}

final gameGatewayProvider = Provider<GameGateway>(
  (ref) => GameGateway(
    firebaseFirestore: ref.watch(firebaseFirestoreProvider),
    firebaseFunctions: ref.watch(firebaseFunctionsProvider),
  ),
);
