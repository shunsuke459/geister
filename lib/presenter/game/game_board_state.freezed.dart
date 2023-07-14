// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameBoardState {
  GameBoard get boardStateList => throw _privateConstructorUsedError;
  bool get displayArrow => throw _privateConstructorUsedError;
  int get arrowCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameBoardStateCopyWith<GameBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameBoardStateCopyWith<$Res> {
  factory $GameBoardStateCopyWith(
          GameBoardState value, $Res Function(GameBoardState) then) =
      _$GameBoardStateCopyWithImpl<$Res, GameBoardState>;
  @useResult
  $Res call({GameBoard boardStateList, bool displayArrow, int arrowCount});

  $GameBoardCopyWith<$Res> get boardStateList;
}

/// @nodoc
class _$GameBoardStateCopyWithImpl<$Res, $Val extends GameBoardState>
    implements $GameBoardStateCopyWith<$Res> {
  _$GameBoardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardStateList = null,
    Object? displayArrow = null,
    Object? arrowCount = null,
  }) {
    return _then(_value.copyWith(
      boardStateList: null == boardStateList
          ? _value.boardStateList
          : boardStateList // ignore: cast_nullable_to_non_nullable
              as GameBoard,
      displayArrow: null == displayArrow
          ? _value.displayArrow
          : displayArrow // ignore: cast_nullable_to_non_nullable
              as bool,
      arrowCount: null == arrowCount
          ? _value.arrowCount
          : arrowCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameBoardCopyWith<$Res> get boardStateList {
    return $GameBoardCopyWith<$Res>(_value.boardStateList, (value) {
      return _then(_value.copyWith(boardStateList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GameBoardStateCopyWith<$Res>
    implements $GameBoardStateCopyWith<$Res> {
  factory _$$_GameBoardStateCopyWith(
          _$_GameBoardState value, $Res Function(_$_GameBoardState) then) =
      __$$_GameBoardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GameBoard boardStateList, bool displayArrow, int arrowCount});

  @override
  $GameBoardCopyWith<$Res> get boardStateList;
}

/// @nodoc
class __$$_GameBoardStateCopyWithImpl<$Res>
    extends _$GameBoardStateCopyWithImpl<$Res, _$_GameBoardState>
    implements _$$_GameBoardStateCopyWith<$Res> {
  __$$_GameBoardStateCopyWithImpl(
      _$_GameBoardState _value, $Res Function(_$_GameBoardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardStateList = null,
    Object? displayArrow = null,
    Object? arrowCount = null,
  }) {
    return _then(_$_GameBoardState(
      boardStateList: null == boardStateList
          ? _value.boardStateList
          : boardStateList // ignore: cast_nullable_to_non_nullable
              as GameBoard,
      displayArrow: null == displayArrow
          ? _value.displayArrow
          : displayArrow // ignore: cast_nullable_to_non_nullable
              as bool,
      arrowCount: null == arrowCount
          ? _value.arrowCount
          : arrowCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GameBoardState implements _GameBoardState {
  const _$_GameBoardState(
      {required this.boardStateList,
      this.displayArrow = false,
      this.arrowCount = 0});

  @override
  final GameBoard boardStateList;
  @override
  @JsonKey()
  final bool displayArrow;
  @override
  @JsonKey()
  final int arrowCount;

  @override
  String toString() {
    return 'GameBoardState(boardStateList: $boardStateList, displayArrow: $displayArrow, arrowCount: $arrowCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameBoardState &&
            (identical(other.boardStateList, boardStateList) ||
                other.boardStateList == boardStateList) &&
            (identical(other.displayArrow, displayArrow) ||
                other.displayArrow == displayArrow) &&
            (identical(other.arrowCount, arrowCount) ||
                other.arrowCount == arrowCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, boardStateList, displayArrow, arrowCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameBoardStateCopyWith<_$_GameBoardState> get copyWith =>
      __$$_GameBoardStateCopyWithImpl<_$_GameBoardState>(this, _$identity);
}

abstract class _GameBoardState implements GameBoardState {
  const factory _GameBoardState(
      {required final GameBoard boardStateList,
      final bool displayArrow,
      final int arrowCount}) = _$_GameBoardState;

  @override
  GameBoard get boardStateList;
  @override
  bool get displayArrow;
  @override
  int get arrowCount;
  @override
  @JsonKey(ignore: true)
  _$$_GameBoardStateCopyWith<_$_GameBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}
