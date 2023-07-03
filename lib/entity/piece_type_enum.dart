enum PieceTypeEnum {
  redGeister,
  blueGeister,
  enemyGeister,
  empty,
}

extension PieceTypeEnumExtension on PieceTypeEnum {
  bool get isEmpty => this == PieceTypeEnum.empty;

  bool get isAllyPiece =>
      this == PieceTypeEnum.redGeister || this == PieceTypeEnum.blueGeister;

  bool get isEnemyPiece => this == PieceTypeEnum.enemyGeister;
}
