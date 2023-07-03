// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'square_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SquareState {
  int get row => throw _privateConstructorUsedError;
  int get column => throw _privateConstructorUsedError;
  String get pieceIcon => throw _privateConstructorUsedError;
  String get arrowIcon => throw _privateConstructorUsedError;
  PieceTypeEnum get pieceType => throw _privateConstructorUsedError;
  ArrowTypeEnum get arrowType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SquareStateCopyWith<SquareState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SquareStateCopyWith<$Res> {
  factory $SquareStateCopyWith(
          SquareState value, $Res Function(SquareState) then) =
      _$SquareStateCopyWithImpl<$Res, SquareState>;
  @useResult
  $Res call(
      {int row,
      int column,
      String pieceIcon,
      String arrowIcon,
      PieceTypeEnum pieceType,
      ArrowTypeEnum arrowType});
}

/// @nodoc
class _$SquareStateCopyWithImpl<$Res, $Val extends SquareState>
    implements $SquareStateCopyWith<$Res> {
  _$SquareStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? row = null,
    Object? column = null,
    Object? pieceIcon = null,
    Object? arrowIcon = null,
    Object? pieceType = null,
    Object? arrowType = null,
  }) {
    return _then(_value.copyWith(
      row: null == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as int,
      pieceIcon: null == pieceIcon
          ? _value.pieceIcon
          : pieceIcon // ignore: cast_nullable_to_non_nullable
              as String,
      arrowIcon: null == arrowIcon
          ? _value.arrowIcon
          : arrowIcon // ignore: cast_nullable_to_non_nullable
              as String,
      pieceType: null == pieceType
          ? _value.pieceType
          : pieceType // ignore: cast_nullable_to_non_nullable
              as PieceTypeEnum,
      arrowType: null == arrowType
          ? _value.arrowType
          : arrowType // ignore: cast_nullable_to_non_nullable
              as ArrowTypeEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SquareStateCopyWith<$Res>
    implements $SquareStateCopyWith<$Res> {
  factory _$$_SquareStateCopyWith(
          _$_SquareState value, $Res Function(_$_SquareState) then) =
      __$$_SquareStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int row,
      int column,
      String pieceIcon,
      String arrowIcon,
      PieceTypeEnum pieceType,
      ArrowTypeEnum arrowType});
}

/// @nodoc
class __$$_SquareStateCopyWithImpl<$Res>
    extends _$SquareStateCopyWithImpl<$Res, _$_SquareState>
    implements _$$_SquareStateCopyWith<$Res> {
  __$$_SquareStateCopyWithImpl(
      _$_SquareState _value, $Res Function(_$_SquareState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? row = null,
    Object? column = null,
    Object? pieceIcon = null,
    Object? arrowIcon = null,
    Object? pieceType = null,
    Object? arrowType = null,
  }) {
    return _then(_$_SquareState(
      row: null == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as int,
      pieceIcon: null == pieceIcon
          ? _value.pieceIcon
          : pieceIcon // ignore: cast_nullable_to_non_nullable
              as String,
      arrowIcon: null == arrowIcon
          ? _value.arrowIcon
          : arrowIcon // ignore: cast_nullable_to_non_nullable
              as String,
      pieceType: null == pieceType
          ? _value.pieceType
          : pieceType // ignore: cast_nullable_to_non_nullable
              as PieceTypeEnum,
      arrowType: null == arrowType
          ? _value.arrowType
          : arrowType // ignore: cast_nullable_to_non_nullable
              as ArrowTypeEnum,
    ));
  }
}

/// @nodoc

class _$_SquareState implements _SquareState {
  const _$_SquareState(
      {required this.row,
      required this.column,
      required this.pieceIcon,
      this.arrowIcon = '',
      required this.pieceType,
      required this.arrowType});

  @override
  final int row;
  @override
  final int column;
  @override
  final String pieceIcon;
  @override
  @JsonKey()
  final String arrowIcon;
  @override
  final PieceTypeEnum pieceType;
  @override
  final ArrowTypeEnum arrowType;

  @override
  String toString() {
    return 'SquareState(row: $row, column: $column, pieceIcon: $pieceIcon, arrowIcon: $arrowIcon, pieceType: $pieceType, arrowType: $arrowType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SquareState &&
            (identical(other.row, row) || other.row == row) &&
            (identical(other.column, column) || other.column == column) &&
            (identical(other.pieceIcon, pieceIcon) ||
                other.pieceIcon == pieceIcon) &&
            (identical(other.arrowIcon, arrowIcon) ||
                other.arrowIcon == arrowIcon) &&
            (identical(other.pieceType, pieceType) ||
                other.pieceType == pieceType) &&
            (identical(other.arrowType, arrowType) ||
                other.arrowType == arrowType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, row, column, pieceIcon, arrowIcon, pieceType, arrowType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SquareStateCopyWith<_$_SquareState> get copyWith =>
      __$$_SquareStateCopyWithImpl<_$_SquareState>(this, _$identity);
}

abstract class _SquareState implements SquareState {
  const factory _SquareState(
      {required final int row,
      required final int column,
      required final String pieceIcon,
      final String arrowIcon,
      required final PieceTypeEnum pieceType,
      required final ArrowTypeEnum arrowType}) = _$_SquareState;

  @override
  int get row;
  @override
  int get column;
  @override
  String get pieceIcon;
  @override
  String get arrowIcon;
  @override
  PieceTypeEnum get pieceType;
  @override
  ArrowTypeEnum get arrowType;
  @override
  @JsonKey(ignore: true)
  _$$_SquareStateCopyWith<_$_SquareState> get copyWith =>
      throw _privateConstructorUsedError;
}
