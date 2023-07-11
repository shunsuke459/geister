// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BattleBoardState {
  BattleBoard get boardStateList => throw _privateConstructorUsedError;
  bool get displayArrow => throw _privateConstructorUsedError;
  int get arrowCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BattleBoardStateCopyWith<BattleBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleBoardStateCopyWith<$Res> {
  factory $BattleBoardStateCopyWith(
          BattleBoardState value, $Res Function(BattleBoardState) then) =
      _$BattleBoardStateCopyWithImpl<$Res, BattleBoardState>;
  @useResult
  $Res call({BattleBoard boardStateList, bool displayArrow, int arrowCount});

  $BattleBoardCopyWith<$Res> get boardStateList;
}

/// @nodoc
class _$BattleBoardStateCopyWithImpl<$Res, $Val extends BattleBoardState>
    implements $BattleBoardStateCopyWith<$Res> {
  _$BattleBoardStateCopyWithImpl(this._value, this._then);

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
              as BattleBoard,
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
  $BattleBoardCopyWith<$Res> get boardStateList {
    return $BattleBoardCopyWith<$Res>(_value.boardStateList, (value) {
      return _then(_value.copyWith(boardStateList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BattleBoardStateCopyWith<$Res>
    implements $BattleBoardStateCopyWith<$Res> {
  factory _$$_BattleBoardStateCopyWith(
          _$_BattleBoardState value, $Res Function(_$_BattleBoardState) then) =
      __$$_BattleBoardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BattleBoard boardStateList, bool displayArrow, int arrowCount});

  @override
  $BattleBoardCopyWith<$Res> get boardStateList;
}

/// @nodoc
class __$$_BattleBoardStateCopyWithImpl<$Res>
    extends _$BattleBoardStateCopyWithImpl<$Res, _$_BattleBoardState>
    implements _$$_BattleBoardStateCopyWith<$Res> {
  __$$_BattleBoardStateCopyWithImpl(
      _$_BattleBoardState _value, $Res Function(_$_BattleBoardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardStateList = null,
    Object? displayArrow = null,
    Object? arrowCount = null,
  }) {
    return _then(_$_BattleBoardState(
      boardStateList: null == boardStateList
          ? _value.boardStateList
          : boardStateList // ignore: cast_nullable_to_non_nullable
              as BattleBoard,
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

class _$_BattleBoardState implements _BattleBoardState {
  const _$_BattleBoardState(
      {required this.boardStateList,
      this.displayArrow = false,
      this.arrowCount = 0});

  @override
  final BattleBoard boardStateList;
  @override
  @JsonKey()
  final bool displayArrow;
  @override
  @JsonKey()
  final int arrowCount;

  @override
  String toString() {
    return 'BattleBoardState(boardStateList: $boardStateList, displayArrow: $displayArrow, arrowCount: $arrowCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BattleBoardState &&
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
  _$$_BattleBoardStateCopyWith<_$_BattleBoardState> get copyWith =>
      __$$_BattleBoardStateCopyWithImpl<_$_BattleBoardState>(this, _$identity);
}

abstract class _BattleBoardState implements BattleBoardState {
  const factory _BattleBoardState(
      {required final BattleBoard boardStateList,
      final bool displayArrow,
      final int arrowCount}) = _$_BattleBoardState;

  @override
  BattleBoard get boardStateList;
  @override
  bool get displayArrow;
  @override
  int get arrowCount;
  @override
  @JsonKey(ignore: true)
  _$$_BattleBoardStateCopyWith<_$_BattleBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}
