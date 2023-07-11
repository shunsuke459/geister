enum ArrowTypeEnum {
  topArrow,
  bottomArrow,
  leftArrow,
  rightArrow,
  none,
}

extension ArrowTypeEnumExtension on ArrowTypeEnum {
  bool get isArrow => this != ArrowTypeEnum.none;
}
