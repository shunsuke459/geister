import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geister/gen/assets.gen.dart';
import 'package:geister/theme/app_theme_color.dart';

class AppIcon extends StatelessWidget {
  final double iconSize;
  final double textSize;
  const AppIcon({
    Key? key,
    this.iconSize = 120,
    this.textSize = 64,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Random().nextBool()
              ? Assets.icons.allyBlueIcon
              : Assets.icons.allyRedIcon,
          width: iconSize,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned(
                  top: 2,
                  left: 2,
                  child: Text(
                    'Fantasmi',
                    style: TextStyle(
                      fontSize: textSize,
                      fontFamily: 'Cherry_Bomb_One',
                      color: AppThemeColor.black.color,
                    ),
                  ),
                ),
                Positioned(
                  child: Text(
                    'Fantasmi',
                    style: TextStyle(
                      fontSize: textSize,
                      fontFamily: 'Cherry_Bomb_One',
                      color: AppThemeColor.accentYellow.color,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
