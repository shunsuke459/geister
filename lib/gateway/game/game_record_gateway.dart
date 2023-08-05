import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geister/gateway/firebase/firebase_firestore.dart';
import 'package:geister/page/game_record/presenter/game_record.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameRecordGateway {
  final FirebaseFirestore firebaseFirestore;
  const GameRecordGateway({required this.firebaseFirestore});

  Future<List<GameRecord>> fetchGameRecordList(String userId) async {
    try {
      final result = await firebaseFirestore
          .collection('records')
          .doc(userId)
          .collection('record')
          .get();

      return result.docs.map((e) {
        return GameRecord(
          opponentUserName: e.data()['user_name'],
          winCount: e.data()['win'],
          loseCount: e.data()['lose'],
        );
      }).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}

final gameRecordGatewayProvider = Provider(
  (ref) => GameRecordGateway(
    firebaseFirestore: ref.read(firebaseFirestoreProvider),
  ),
);
