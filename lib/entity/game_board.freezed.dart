// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameBoard {
  List<List<SquareState>> get gameBoard => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameBoardCopyWith<GameBoard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameBoardCopyWith<$Res> {
  factory $GameBoardCopyWith(GameBoard value, $Res Function(GameBoard) then) =
      _$GameBoardCopyWithImpl<$Res, GameBoard>;
  @useResult
  $Res call({List<List<SquareState>> gameBoard});
}

/// @nodoc
class _$GameBoardCopyWithImpl<$Res, $Val extends GameBoard>
    implements $GameBoardCopyWith<$Res> {
  _$GameBoardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameBoard = null,
  }) {
    return _then(_value.copyWith(
      gameBoard: null == gameBoard
          ? _value.gameBoard
          : gameBoard // ignore: cast_nullable_to_non_nullable
              as List<List<SquareState>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameBoardCopyWith<$Res> implements $GameBoardCopyWith<$Res> {
  factory _$$_GameBoardCopyWith(
          _$_GameBoard value, $Res Function(_$_GameBoard) then) =
      __$$_GameBoardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List<SquareState>> gameBoard});
}

/// @nodoc
class __$$_GameBoardCopyWithImpl<$Res>
    extends _$GameBoardCopyWithImpl<$Res, _$_GameBoard>
    implements _$$_GameBoardCopyWith<$Res> {
  __$$_GameBoardCopyWithImpl(
      _$_GameBoard _value, $Res Function(_$_GameBoard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameBoard = null,
  }) {
    return _then(_$_GameBoard(
      gameBoard: null == gameBoard
          ? _value._gameBoard
          : gameBoard // ignore: cast_nullable_to_non_nullable
              as List<List<SquareState>>,
    ));
  }
}

/// @nodoc

class _$_GameBoard implements _GameBoard {
  const _$_GameBoard({required final List<List<SquareState>> gameBoard})
      : _gameBoard = gameBoard;

  final List<List<SquareState>> _gameBoard;
  @override
  List<List<SquareState>> get gameBoard {
    if (_gameBoard is EqualUnmodifiableListView) return _gameBoard;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gameBoard);
  }

  @override
  String toString() {
    return 'GameBoard(gameBoard: $gameBoard)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameBoard &&
            const DeepCollectionEquality()
                .equals(other._gameBoard, _gameBoard));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_gameBoard));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameBoardCopyWith<_$_GameBoard> get copyWith =>
      __$$_GameBoardCopyWithImpl<_$_GameBoard>(this, _$identity);
}

abstract class _GameBoard implements GameBoard {
  const factory _GameBoard({required final List<List<SquareState>> gameBoard}) =
      _$_GameBoard;

  @override
  List<List<SquareState>> get gameBoard;
  @override
  @JsonKey(ignore: true)
  _$$_GameBoardCopyWith<_$_GameBoard> get copyWith =>
      throw _privateConstructorUsedError;
}
