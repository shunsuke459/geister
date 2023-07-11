// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BattleBoard {
  List<List<SquareState>> get battleBoard => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BattleBoardCopyWith<BattleBoard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleBoardCopyWith<$Res> {
  factory $BattleBoardCopyWith(
          BattleBoard value, $Res Function(BattleBoard) then) =
      _$BattleBoardCopyWithImpl<$Res, BattleBoard>;
  @useResult
  $Res call({List<List<SquareState>> battleBoard});
}

/// @nodoc
class _$BattleBoardCopyWithImpl<$Res, $Val extends BattleBoard>
    implements $BattleBoardCopyWith<$Res> {
  _$BattleBoardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battleBoard = null,
  }) {
    return _then(_value.copyWith(
      battleBoard: null == battleBoard
          ? _value.battleBoard
          : battleBoard // ignore: cast_nullable_to_non_nullable
              as List<List<SquareState>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BattleBoardCopyWith<$Res>
    implements $BattleBoardCopyWith<$Res> {
  factory _$$_BattleBoardCopyWith(
          _$_BattleBoard value, $Res Function(_$_BattleBoard) then) =
      __$$_BattleBoardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List<SquareState>> battleBoard});
}

/// @nodoc
class __$$_BattleBoardCopyWithImpl<$Res>
    extends _$BattleBoardCopyWithImpl<$Res, _$_BattleBoard>
    implements _$$_BattleBoardCopyWith<$Res> {
  __$$_BattleBoardCopyWithImpl(
      _$_BattleBoard _value, $Res Function(_$_BattleBoard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battleBoard = null,
  }) {
    return _then(_$_BattleBoard(
      battleBoard: null == battleBoard
          ? _value._battleBoard
          : battleBoard // ignore: cast_nullable_to_non_nullable
              as List<List<SquareState>>,
    ));
  }
}

/// @nodoc

class _$_BattleBoard implements _BattleBoard {
  const _$_BattleBoard({required final List<List<SquareState>> battleBoard})
      : _battleBoard = battleBoard;

  final List<List<SquareState>> _battleBoard;
  @override
  List<List<SquareState>> get battleBoard {
    if (_battleBoard is EqualUnmodifiableListView) return _battleBoard;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_battleBoard);
  }

  @override
  String toString() {
    return 'BattleBoard(battleBoard: $battleBoard)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BattleBoard &&
            const DeepCollectionEquality()
                .equals(other._battleBoard, _battleBoard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_battleBoard));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BattleBoardCopyWith<_$_BattleBoard> get copyWith =>
      __$$_BattleBoardCopyWithImpl<_$_BattleBoard>(this, _$identity);
}

abstract class _BattleBoard implements BattleBoard {
  const factory _BattleBoard(
      {required final List<List<SquareState>> battleBoard}) = _$_BattleBoard;

  @override
  List<List<SquareState>> get battleBoard;
  @override
  @JsonKey(ignore: true)
  _$$_BattleBoardCopyWith<_$_BattleBoard> get copyWith =>
      throw _privateConstructorUsedError;
}
