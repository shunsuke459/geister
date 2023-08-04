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
  List<List<PieceTypeEnum>> get initialArrangement =>
      throw _privateConstructorUsedError;
  GameBoard? get boardStateList => throw _privateConstructorUsedError;
  bool get displayArrow => throw _privateConstructorUsedError;
  bool get isMyTurn => throw _privateConstructorUsedError;
  int get redPieceCount => throw _privateConstructorUsedError;
  int get bluePieceCount => throw _privateConstructorUsedError;
  bool get allyGoaled => throw _privateConstructorUsedError;
  bool get opponentGoaled => throw _privateConstructorUsedError;

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
  $Res call(
      {List<List<PieceTypeEnum>> initialArrangement,
      GameBoard? boardStateList,
      bool displayArrow,
      bool isMyTurn,
      int redPieceCount,
      int bluePieceCount,
      bool allyGoaled,
      bool opponentGoaled});

  $GameBoardCopyWith<$Res>? get boardStateList;
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
    Object? initialArrangement = null,
    Object? boardStateList = freezed,
    Object? displayArrow = null,
    Object? isMyTurn = null,
    Object? redPieceCount = null,
    Object? bluePieceCount = null,
    Object? allyGoaled = null,
    Object? opponentGoaled = null,
  }) {
    return _then(_value.copyWith(
      initialArrangement: null == initialArrangement
          ? _value.initialArrangement
          : initialArrangement // ignore: cast_nullable_to_non_nullable
              as List<List<PieceTypeEnum>>,
      boardStateList: freezed == boardStateList
          ? _value.boardStateList
          : boardStateList // ignore: cast_nullable_to_non_nullable
              as GameBoard?,
      displayArrow: null == displayArrow
          ? _value.displayArrow
          : displayArrow // ignore: cast_nullable_to_non_nullable
              as bool,
      isMyTurn: null == isMyTurn
          ? _value.isMyTurn
          : isMyTurn // ignore: cast_nullable_to_non_nullable
              as bool,
      redPieceCount: null == redPieceCount
          ? _value.redPieceCount
          : redPieceCount // ignore: cast_nullable_to_non_nullable
              as int,
      bluePieceCount: null == bluePieceCount
          ? _value.bluePieceCount
          : bluePieceCount // ignore: cast_nullable_to_non_nullable
              as int,
      allyGoaled: null == allyGoaled
          ? _value.allyGoaled
          : allyGoaled // ignore: cast_nullable_to_non_nullable
              as bool,
      opponentGoaled: null == opponentGoaled
          ? _value.opponentGoaled
          : opponentGoaled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameBoardCopyWith<$Res>? get boardStateList {
    if (_value.boardStateList == null) {
      return null;
    }

    return $GameBoardCopyWith<$Res>(_value.boardStateList!, (value) {
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
  $Res call(
      {List<List<PieceTypeEnum>> initialArrangement,
      GameBoard? boardStateList,
      bool displayArrow,
      bool isMyTurn,
      int redPieceCount,
      int bluePieceCount,
      bool allyGoaled,
      bool opponentGoaled});

  @override
  $GameBoardCopyWith<$Res>? get boardStateList;
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
    Object? initialArrangement = null,
    Object? boardStateList = freezed,
    Object? displayArrow = null,
    Object? isMyTurn = null,
    Object? redPieceCount = null,
    Object? bluePieceCount = null,
    Object? allyGoaled = null,
    Object? opponentGoaled = null,
  }) {
    return _then(_$_GameBoardState(
      initialArrangement: null == initialArrangement
          ? _value._initialArrangement
          : initialArrangement // ignore: cast_nullable_to_non_nullable
              as List<List<PieceTypeEnum>>,
      boardStateList: freezed == boardStateList
          ? _value.boardStateList
          : boardStateList // ignore: cast_nullable_to_non_nullable
              as GameBoard?,
      displayArrow: null == displayArrow
          ? _value.displayArrow
          : displayArrow // ignore: cast_nullable_to_non_nullable
              as bool,
      isMyTurn: null == isMyTurn
          ? _value.isMyTurn
          : isMyTurn // ignore: cast_nullable_to_non_nullable
              as bool,
      redPieceCount: null == redPieceCount
          ? _value.redPieceCount
          : redPieceCount // ignore: cast_nullable_to_non_nullable
              as int,
      bluePieceCount: null == bluePieceCount
          ? _value.bluePieceCount
          : bluePieceCount // ignore: cast_nullable_to_non_nullable
              as int,
      allyGoaled: null == allyGoaled
          ? _value.allyGoaled
          : allyGoaled // ignore: cast_nullable_to_non_nullable
              as bool,
      opponentGoaled: null == opponentGoaled
          ? _value.opponentGoaled
          : opponentGoaled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GameBoardState implements _GameBoardState {
  const _$_GameBoardState(
      {required final List<List<PieceTypeEnum>> initialArrangement,
      this.boardStateList,
      this.displayArrow = false,
      this.isMyTurn = false,
      this.redPieceCount = 4,
      this.bluePieceCount = 4,
      this.allyGoaled = false,
      this.opponentGoaled = false})
      : _initialArrangement = initialArrangement;

  final List<List<PieceTypeEnum>> _initialArrangement;
  @override
  List<List<PieceTypeEnum>> get initialArrangement {
    if (_initialArrangement is EqualUnmodifiableListView)
      return _initialArrangement;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_initialArrangement);
  }

  @override
  final GameBoard? boardStateList;
  @override
  @JsonKey()
  final bool displayArrow;
  @override
  @JsonKey()
  final bool isMyTurn;
  @override
  @JsonKey()
  final int redPieceCount;
  @override
  @JsonKey()
  final int bluePieceCount;
  @override
  @JsonKey()
  final bool allyGoaled;
  @override
  @JsonKey()
  final bool opponentGoaled;

  @override
  String toString() {
    return 'GameBoardState(initialArrangement: $initialArrangement, boardStateList: $boardStateList, displayArrow: $displayArrow, isMyTurn: $isMyTurn, redPieceCount: $redPieceCount, bluePieceCount: $bluePieceCount, allyGoaled: $allyGoaled, opponentGoaled: $opponentGoaled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameBoardState &&
            const DeepCollectionEquality()
                .equals(other._initialArrangement, _initialArrangement) &&
            (identical(other.boardStateList, boardStateList) ||
                other.boardStateList == boardStateList) &&
            (identical(other.displayArrow, displayArrow) ||
                other.displayArrow == displayArrow) &&
            (identical(other.isMyTurn, isMyTurn) ||
                other.isMyTurn == isMyTurn) &&
            (identical(other.redPieceCount, redPieceCount) ||
                other.redPieceCount == redPieceCount) &&
            (identical(other.bluePieceCount, bluePieceCount) ||
                other.bluePieceCount == bluePieceCount) &&
            (identical(other.allyGoaled, allyGoaled) ||
                other.allyGoaled == allyGoaled) &&
            (identical(other.opponentGoaled, opponentGoaled) ||
                other.opponentGoaled == opponentGoaled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_initialArrangement),
      boardStateList,
      displayArrow,
      isMyTurn,
      redPieceCount,
      bluePieceCount,
      allyGoaled,
      opponentGoaled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameBoardStateCopyWith<_$_GameBoardState> get copyWith =>
      __$$_GameBoardStateCopyWithImpl<_$_GameBoardState>(this, _$identity);
}

abstract class _GameBoardState implements GameBoardState {
  const factory _GameBoardState(
      {required final List<List<PieceTypeEnum>> initialArrangement,
      final GameBoard? boardStateList,
      final bool displayArrow,
      final bool isMyTurn,
      final int redPieceCount,
      final int bluePieceCount,
      final bool allyGoaled,
      final bool opponentGoaled}) = _$_GameBoardState;

  @override
  List<List<PieceTypeEnum>> get initialArrangement;
  @override
  GameBoard? get boardStateList;
  @override
  bool get displayArrow;
  @override
  bool get isMyTurn;
  @override
  int get redPieceCount;
  @override
  int get bluePieceCount;
  @override
  bool get allyGoaled;
  @override
  bool get opponentGoaled;
  @override
  @JsonKey(ignore: true)
  _$$_GameBoardStateCopyWith<_$_GameBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}
