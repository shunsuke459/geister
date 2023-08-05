// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_record_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameRecordState {
  List<GameRecord> get gameRecordList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameRecordStateCopyWith<GameRecordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameRecordStateCopyWith<$Res> {
  factory $GameRecordStateCopyWith(
          GameRecordState value, $Res Function(GameRecordState) then) =
      _$GameRecordStateCopyWithImpl<$Res, GameRecordState>;
  @useResult
  $Res call({List<GameRecord> gameRecordList});
}

/// @nodoc
class _$GameRecordStateCopyWithImpl<$Res, $Val extends GameRecordState>
    implements $GameRecordStateCopyWith<$Res> {
  _$GameRecordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameRecordList = null,
  }) {
    return _then(_value.copyWith(
      gameRecordList: null == gameRecordList
          ? _value.gameRecordList
          : gameRecordList // ignore: cast_nullable_to_non_nullable
              as List<GameRecord>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameRecordStateCopyWith<$Res>
    implements $GameRecordStateCopyWith<$Res> {
  factory _$$_GameRecordStateCopyWith(
          _$_GameRecordState value, $Res Function(_$_GameRecordState) then) =
      __$$_GameRecordStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GameRecord> gameRecordList});
}

/// @nodoc
class __$$_GameRecordStateCopyWithImpl<$Res>
    extends _$GameRecordStateCopyWithImpl<$Res, _$_GameRecordState>
    implements _$$_GameRecordStateCopyWith<$Res> {
  __$$_GameRecordStateCopyWithImpl(
      _$_GameRecordState _value, $Res Function(_$_GameRecordState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameRecordList = null,
  }) {
    return _then(_$_GameRecordState(
      gameRecordList: null == gameRecordList
          ? _value._gameRecordList
          : gameRecordList // ignore: cast_nullable_to_non_nullable
              as List<GameRecord>,
    ));
  }
}

/// @nodoc

class _$_GameRecordState implements _GameRecordState {
  const _$_GameRecordState({final List<GameRecord> gameRecordList = const []})
      : _gameRecordList = gameRecordList;

  final List<GameRecord> _gameRecordList;
  @override
  @JsonKey()
  List<GameRecord> get gameRecordList {
    if (_gameRecordList is EqualUnmodifiableListView) return _gameRecordList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gameRecordList);
  }

  @override
  String toString() {
    return 'GameRecordState(gameRecordList: $gameRecordList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameRecordState &&
            const DeepCollectionEquality()
                .equals(other._gameRecordList, _gameRecordList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_gameRecordList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameRecordStateCopyWith<_$_GameRecordState> get copyWith =>
      __$$_GameRecordStateCopyWithImpl<_$_GameRecordState>(this, _$identity);
}

abstract class _GameRecordState implements GameRecordState {
  const factory _GameRecordState({final List<GameRecord> gameRecordList}) =
      _$_GameRecordState;

  @override
  List<GameRecord> get gameRecordList;
  @override
  @JsonKey(ignore: true)
  _$$_GameRecordStateCopyWith<_$_GameRecordState> get copyWith =>
      throw _privateConstructorUsedError;
}
