import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geister/entity/arrow_type_enum.dart';
import 'package:geister/entity/piece_type_enum.dart';
import 'package:geister/gen/assets.gen.dart';

part 'square_state.freezed.dart';

@freezed
class SquareState with _$SquareState {
  const factory SquareState({
    required int row,
    required int column,
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

  bool canShowArrow() {
    return pieceType.isEmpty || pieceType.isEnemyPiece;
  }

  String get pieceIcon => pieceType.isRedPiece
      ? Assets.icons.allyRedIcon
      : pieceType.isBluePiece
          ? Assets.icons.allyBlueIcon
          : pieceType.isEnemyPiece
              ? Assets.icons.enemyIcon
              : '';
}
