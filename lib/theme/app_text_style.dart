import 'package:flutter/material.dart';

TextStyle textStyle(AppTextStyle appTextStyle, Color color) {
  final baseStyle = appTextStyle.style;
  return baseStyle.merge(TextStyle(color: color));
}

enum AppTextStyle {
  tinyRegular,
  tinyBold,
  captionRegular,
  captionBold,
  bodyRegular,
  bodyBold,
  titleRegular,
  titleBold,
  headlineBold,
  bigBold,
}

extension _AppTextStyleExtension on AppTextStyle {
  TextStyle get style {
    switch (this) {
      case AppTextStyle.tinyRegular:
        return const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        );
      case AppTextStyle.tinyBold:
        return const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.captionRegular:
        return const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        );
      case AppTextStyle.captionBold:
        return const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.bodyRegular:
        return const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        );
      case AppTextStyle.bodyBold:
        return const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.titleRegular:
        return const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        );
      case AppTextStyle.titleBold:
        return const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.headlineBold:
        return const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.bigBold:
        return const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
        );
    }
  }
}
