// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameState {
  String get keyWord => throw _privateConstructorUsedError;
  bool get isMatched => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  int get readyNum => throw _privateConstructorUsedError;
  String get myId => throw _privateConstructorUsedError;
  String? get opponentId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {String keyWord,
      bool isMatched,
      bool isSearching,
      int readyNum,
      String myId,
      String? opponentId});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyWord = null,
    Object? isMatched = null,
    Object? isSearching = null,
    Object? readyNum = null,
    Object? myId = null,
    Object? opponentId = freezed,
  }) {
    return _then(_value.copyWith(
      keyWord: null == keyWord
          ? _value.keyWord
          : keyWord // ignore: cast_nullable_to_non_nullable
              as String,
      isMatched: null == isMatched
          ? _value.isMatched
          : isMatched // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      readyNum: null == readyNum
          ? _value.readyNum
          : readyNum // ignore: cast_nullable_to_non_nullable
              as int,
      myId: null == myId
          ? _value.myId
          : myId // ignore: cast_nullable_to_non_nullable
              as String,
      opponentId: freezed == opponentId
          ? _value.opponentId
          : opponentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$$_GameStateCopyWith(
          _$_GameState value, $Res Function(_$_GameState) then) =
      __$$_GameStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String keyWord,
      bool isMatched,
      bool isSearching,
      int readyNum,
      String myId,
      String? opponentId});
}

/// @nodoc
class __$$_GameStateCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$_GameState>
    implements _$$_GameStateCopyWith<$Res> {
  __$$_GameStateCopyWithImpl(
      _$_GameState _value, $Res Function(_$_GameState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyWord = null,
    Object? isMatched = null,
    Object? isSearching = null,
    Object? readyNum = null,
    Object? myId = null,
    Object? opponentId = freezed,
  }) {
    return _then(_$_GameState(
      keyWord: null == keyWord
          ? _value.keyWord
          : keyWord // ignore: cast_nullable_to_non_nullable
              as String,
      isMatched: null == isMatched
          ? _value.isMatched
          : isMatched // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      readyNum: null == readyNum
          ? _value.readyNum
          : readyNum // ignore: cast_nullable_to_non_nullable
              as int,
      myId: null == myId
          ? _value.myId
          : myId // ignore: cast_nullable_to_non_nullable
              as String,
      opponentId: freezed == opponentId
          ? _value.opponentId
          : opponentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GameState implements _GameState {
  const _$_GameState(
      {required this.keyWord,
      required this.isMatched,
      required this.isSearching,
      this.readyNum = 0,
      required this.myId,
      this.opponentId});

  @override
  final String keyWord;
  @override
  final bool isMatched;
  @override
  final bool isSearching;
  @override
  @JsonKey()
  final int readyNum;
  @override
  final String myId;
  @override
  final String? opponentId;

  @override
  String toString() {
    return 'GameState(keyWord: $keyWord, isMatched: $isMatched, isSearching: $isSearching, readyNum: $readyNum, myId: $myId, opponentId: $opponentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameState &&
            (identical(other.keyWord, keyWord) || other.keyWord == keyWord) &&
            (identical(other.isMatched, isMatched) ||
                other.isMatched == isMatched) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.readyNum, readyNum) ||
                other.readyNum == readyNum) &&
            (identical(other.myId, myId) || other.myId == myId) &&
            (identical(other.opponentId, opponentId) ||
                other.opponentId == opponentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, keyWord, isMatched, isSearching, readyNum, myId, opponentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameStateCopyWith<_$_GameState> get copyWith =>
      __$$_GameStateCopyWithImpl<_$_GameState>(this, _$identity);
}

abstract class _GameState implements GameState {
  const factory _GameState(
      {required final String keyWord,
      required final bool isMatched,
      required final bool isSearching,
      final int readyNum,
      required final String myId,
      final String? opponentId}) = _$_GameState;

  @override
  String get keyWord;
  @override
  bool get isMatched;
  @override
  bool get isSearching;
  @override
  int get readyNum;
  @override
  String get myId;
  @override
  String? get opponentId;
  @override
  @JsonKey(ignore: true)
  _$$_GameStateCopyWith<_$_GameState> get copyWith =>
      throw _privateConstructorUsedError;
}
