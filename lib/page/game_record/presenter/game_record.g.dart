// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameRecord _$$_GameRecordFromJson(Map<String, dynamic> json) =>
    _$_GameRecord(
      opponentUserName: json['opponentUserName'] as String,
      winCount: json['winCount'] as int,
      loseCount: json['loseCount'] as int,
    );

Map<String, dynamic> _$$_GameRecordToJson(_$_GameRecord instance) =>
    <String, dynamic>{
      'opponentUserName': instance.opponentUserName,
      'winCount': instance.winCount,
      'loseCount': instance.loseCount,
    };
