// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameRecord _$GameRecordFromJson(Map<String, dynamic> json) {
  return _GameRecord.fromJson(json);
}

/// @nodoc
mixin _$GameRecord {
  String get opponentUserName => throw _privateConstructorUsedError;
  int get winCount => throw _privateConstructorUsedError;
  int get loseCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameRecordCopyWith<GameRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameRecordCopyWith<$Res> {
  factory $GameRecordCopyWith(
          GameRecord value, $Res Function(GameRecord) then) =
      _$GameRecordCopyWithImpl<$Res, GameRecord>;
  @useResult
  $Res call({String opponentUserName, int winCount, int loseCount});
}

/// @nodoc
class _$GameRecordCopyWithImpl<$Res, $Val extends GameRecord>
    implements $GameRecordCopyWith<$Res> {
  _$GameRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opponentUserName = null,
    Object? winCount = null,
    Object? loseCount = null,
  }) {
    return _then(_value.copyWith(
      opponentUserName: null == opponentUserName
          ? _value.opponentUserName
          : opponentUserName // ignore: cast_nullable_to_non_nullable
              as String,
      winCount: null == winCount
          ? _value.winCount
          : winCount // ignore: cast_nullable_to_non_nullable
              as int,
      loseCount: null == loseCount
          ? _value.loseCount
          : loseCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameRecordCopyWith<$Res>
    implements $GameRecordCopyWith<$Res> {
  factory _$$_GameRecordCopyWith(
          _$_GameRecord value, $Res Function(_$_GameRecord) then) =
      __$$_GameRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String opponentUserName, int winCount, int loseCount});
}

/// @nodoc
class __$$_GameRecordCopyWithImpl<$Res>
    extends _$GameRecordCopyWithImpl<$Res, _$_GameRecord>
    implements _$$_GameRecordCopyWith<$Res> {
  __$$_GameRecordCopyWithImpl(
      _$_GameRecord _value, $Res Function(_$_GameRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opponentUserName = null,
    Object? winCount = null,
    Object? loseCount = null,
  }) {
    return _then(_$_GameRecord(
      opponentUserName: null == opponentUserName
          ? _value.opponentUserName
          : opponentUserName // ignore: cast_nullable_to_non_nullable
              as String,
      winCount: null == winCount
          ? _value.winCount
          : winCount // ignore: cast_nullable_to_non_nullable
              as int,
      loseCount: null == loseCount
          ? _value.loseCount
          : loseCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameRecord implements _GameRecord {
  const _$_GameRecord(
      {required this.opponentUserName,
      required this.winCount,
      required this.loseCount});

  factory _$_GameRecord.fromJson(Map<String, dynamic> json) =>
      _$$_GameRecordFromJson(json);

  @override
  final String opponentUserName;
  @override
  final int winCount;
  @override
  final int loseCount;

  @override
  String toString() {
    return 'GameRecord(opponentUserName: $opponentUserName, winCount: $winCount, loseCount: $loseCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameRecord &&
            (identical(other.opponentUserName, opponentUserName) ||
                other.opponentUserName == opponentUserName) &&
            (identical(other.winCount, winCount) ||
                other.winCount == winCount) &&
            (identical(other.loseCount, loseCount) ||
                other.loseCount == loseCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, opponentUserName, winCount, loseCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameRecordCopyWith<_$_GameRecord> get copyWith =>
      __$$_GameRecordCopyWithImpl<_$_GameRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameRecordToJson(
      this,
    );
  }
}

abstract class _GameRecord implements GameRecord {
  const factory _GameRecord(
      {required final String opponentUserName,
      required final int winCount,
      required final int loseCount}) = _$_GameRecord;

  factory _GameRecord.fromJson(Map<String, dynamic> json) =
      _$_GameRecord.fromJson;

  @override
  String get opponentUserName;
  @override
  int get winCount;
  @override
  int get loseCount;
  @override
  @JsonKey(ignore: true)
  _$$_GameRecordCopyWith<_$_GameRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
