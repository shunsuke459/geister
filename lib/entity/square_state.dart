import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geister/entity/arrow_type_enum.dart';
import 'package:geister/entity/piece_type_enum.dart';

part 'square_state.freezed.dart';

@freezed
class SquareState with _$SquareState {
  const factory SquareState({
    required int row,
    required int column,
    required String pieceIcon,
    required PieceTypeEnum pieceType,
    @Default('') String arrowIcon,
    required ArrowTypeEnum arrowType,
  }) = _SquareState;
}

extension SquareStateExtension on SquareState {
  bool isLeftPiece(int row, int column) {
    return row == this.row && column == this.column + 1;
  }

  bool isRightPiece(int row, int column) {
    return row == this.row && column == this.column - 1;
  }

  bool isTopPiece(int row, int column) {
    return row == this.row + 1 && column == this.column;
  }

  bool isBottomPiece(int row, int column) {
    return row == this.row - 1 && column == this.column;
  }

  bool isEmpty() {
    return pieceType.isEmpty;
  }
}
