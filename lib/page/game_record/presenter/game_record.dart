import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_record.freezed.dart';
part 'game_record.g.dart';

@freezed
class GameRecord with _$GameRecord {
  const factory GameRecord({
    required String opponentUserName,
    required int winCount,
    required int loseCount,
  }) = _GameRecord;

  factory GameRecord.fromJson(Map<String, dynamic> json) =>
      _$GameRecordFromJson(json);
}
