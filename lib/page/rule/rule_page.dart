import 'package:flutter/material.dart';
import 'package:geister/theme/app_text_style.dart';
import 'package:geister/theme/app_theme_color.dart';

class RulePage extends StatelessWidget {
  const RulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '製作中...',
          style: textStyle(
            AppTextStyle.bodyRegular,
            AppThemeColor.black.color,
          ),
        ),
      ),
    );
  }
}
