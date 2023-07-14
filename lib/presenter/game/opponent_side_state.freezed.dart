// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opponent_side_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OpponentSideState {
  int get allyRedPieceCount => throw _privateConstructorUsedError;
  int get allyBluePieceCount => throw _privateConstructorUsedError;
  int get enemyRedPieceCount => throw _privateConstructorUsedError;
  int get enemyBluePieceCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OpponentSideStateCopyWith<OpponentSideState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpponentSideStateCopyWith<$Res> {
  factory $OpponentSideStateCopyWith(
          OpponentSideState value, $Res Function(OpponentSideState) then) =
      _$OpponentSideStateCopyWithImpl<$Res, OpponentSideState>;
  @useResult
  $Res call(
      {int allyRedPieceCount,
      int allyBluePieceCount,
      int enemyRedPieceCount,
      int enemyBluePieceCount});
}

/// @nodoc
class _$OpponentSideStateCopyWithImpl<$Res, $Val extends OpponentSideState>
    implements $OpponentSideStateCopyWith<$Res> {
  _$OpponentSideStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allyRedPieceCount = null,
    Object? allyBluePieceCount = null,
    Object? enemyRedPieceCount = null,
    Object? enemyBluePieceCount = null,
  }) {
    return _then(_value.copyWith(
      allyRedPieceCount: null == allyRedPieceCount
          ? _value.allyRedPieceCount
          : allyRedPieceCount // ignore: cast_nullable_to_non_nullable
              as int,
      allyBluePieceCount: null == allyBluePieceCount
          ? _value.allyBluePieceCount
          : allyBluePieceCount // ignore: cast_nullable_to_non_nullable
              as int,
      enemyRedPieceCount: null == enemyRedPieceCount
          ? _value.enemyRedPieceCount
          : enemyRedPieceCount // ignore: cast_nullable_to_non_nullable
              as int,
      enemyBluePieceCount: null == enemyBluePieceCount
          ? _value.enemyBluePieceCount
          : enemyBluePieceCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OpponentSideStateCopyWith<$Res>
    implements $OpponentSideStateCopyWith<$Res> {
  factory _$$_OpponentSideStateCopyWith(_$_OpponentSideState value,
          $Res Function(_$_OpponentSideState) then) =
      __$$_OpponentSideStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int allyRedPieceCount,
      int allyBluePieceCount,
      int enemyRedPieceCount,
      int enemyBluePieceCount});
}

/// @nodoc
class __$$_OpponentSideStateCopyWithImpl<$Res>
    extends _$OpponentSideStateCopyWithImpl<$Res, _$_OpponentSideState>
    implements _$$_OpponentSideStateCopyWith<$Res> {
  __$$_OpponentSideStateCopyWithImpl(
      _$_OpponentSideState _value, $Res Function(_$_OpponentSideState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allyRedPieceCount = null,
    Object? allyBluePieceCount = null,
    Object? enemyRedPieceCount = null,
    Object? enemyBluePieceCount = null,
  }) {
    return _then(_$_OpponentSideState(
      allyRedPieceCount: null == allyRedPieceCount
          ? _value.allyRedPieceCount
          : allyRedPieceCount // ignore: cast_nullable_to_non_nullable
              as int,
      allyBluePieceCount: null == allyBluePieceCount
          ? _value.allyBluePieceCount
          : allyBluePieceCount // ignore: cast_nullable_to_non_nullable
              as int,
      enemyRedPieceCount: null == enemyRedPieceCount
          ? _value.enemyRedPieceCount
          : enemyRedPieceCount // ignore: cast_nullable_to_non_nullable
              as int,
      enemyBluePieceCount: null == enemyBluePieceCount
          ? _value.enemyBluePieceCount
          : enemyBluePieceCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OpponentSideState implements _OpponentSideState {
  const _$_OpponentSideState(
      {this.allyRedPieceCount = 4,
      this.allyBluePieceCount = 4,
      this.enemyRedPieceCount = 0,
      this.enemyBluePieceCount = 0});

  @override
  @JsonKey()
  final int allyRedPieceCount;
  @override
  @JsonKey()
  final int allyBluePieceCount;
  @override
  @JsonKey()
  final int enemyRedPieceCount;
  @override
  @JsonKey()
  final int enemyBluePieceCount;

  @override
  String toString() {
    return 'OpponentSideState(allyRedPieceCount: $allyRedPieceCount, allyBluePieceCount: $allyBluePieceCount, enemyRedPieceCount: $enemyRedPieceCount, enemyBluePieceCount: $enemyBluePieceCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OpponentSideState &&
            (identical(other.allyRedPieceCount, allyRedPieceCount) ||
                other.allyRedPieceCount == allyRedPieceCount) &&
            (identical(other.allyBluePieceCount, allyBluePieceCount) ||
                other.allyBluePieceCount == allyBluePieceCount) &&
            (identical(other.enemyRedPieceCount, enemyRedPieceCount) ||
                other.enemyRedPieceCount == enemyRedPieceCount) &&
            (identical(other.enemyBluePieceCount, enemyBluePieceCount) ||
                other.enemyBluePieceCount == enemyBluePieceCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, allyRedPieceCount,
      allyBluePieceCount, enemyRedPieceCount, enemyBluePieceCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OpponentSideStateCopyWith<_$_OpponentSideState> get copyWith =>
      __$$_OpponentSideStateCopyWithImpl<_$_OpponentSideState>(
          this, _$identity);
}

abstract class _OpponentSideState implements OpponentSideState {
  const factory _OpponentSideState(
      {final int allyRedPieceCount,
      final int allyBluePieceCount,
      final int enemyRedPieceCount,
      final int enemyBluePieceCount}) = _$_OpponentSideState;

  @override
  int get allyRedPieceCount;
  @override
  int get allyBluePieceCount;
  @override
  int get enemyRedPieceCount;
  @override
  int get enemyBluePieceCount;
  @override
  @JsonKey(ignore: true)
  _$$_OpponentSideStateCopyWith<_$_OpponentSideState> get copyWith =>
      throw _privateConstructorUsedError;
}
