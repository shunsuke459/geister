import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geister/page/game_record/presenter/game_record.dart';

part 'game_record_state.freezed.dart';

@freezed
class GameRecordState with _$GameRecordState {
  const factory GameRecordState({
    @Default([]) List<GameRecord> gameRecordList,
  }) = _GameRecordState;
}
