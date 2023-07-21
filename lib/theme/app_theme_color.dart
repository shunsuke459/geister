import 'dart:ui';

enum AppThemeColor {
  black,
  blackOpacity,
  white,
  stop,
  red,
  accentBlue,
  textMain,
  grayMain,
  graySub,
  graySubtle,
  grayBorder,
  accentYellow,
}

extension AppThemeColorExtension on AppThemeColor {
  Color get color {
    switch (this) {
      case AppThemeColor.black:
        return const Color(0xFF000000);
      case AppThemeColor.blackOpacity:
        return const Color(0xFF000000).withOpacity(0.5);
      case AppThemeColor.white:
        return const Color(0xFFFFFFFF);
      case AppThemeColor.stop:
        return const Color(0xFFDF5656);
      case AppThemeColor.red:
        return const Color(0xFFDA430D);
      case AppThemeColor.accentBlue:
        return const Color(0xFF3AABD2);
      case AppThemeColor.textMain:
        return const Color(0xFF333333);
      case AppThemeColor.grayMain:
        return const Color(0xFF666666);
      case AppThemeColor.graySub:
        return const Color(0xFF999999);
      case AppThemeColor.graySubtle:
        return const Color(0xFFCCCCCC);
      case AppThemeColor.grayBorder:
        return const Color(0xFFF0F0F0);
      case AppThemeColor.accentYellow:
        return const Color(0xFFFFD334);
    }
  }
}
