import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geister/gen/assets.gen.dart';
import 'package:geister/theme/app_text_style.dart';
import 'package:geister/theme/app_theme_color.dart';

class RulePage extends StatelessWidget {
  const RulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ゲームのルール',
          style: textStyle(
            AppTextStyle.titleRegular,
            AppThemeColor.black.color,
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppThemeColor.black.color,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  '勝利条件',
                  style: textStyle(
                    AppTextStyle.bodyBold,
                    AppThemeColor.black.color,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '以下の3つのうちいずれか一つを満たしたら勝利です',
                style: textStyle(
                  AppTextStyle.bodyRegular,
                  AppThemeColor.black.color,
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '1. 相手の',
                          style: textStyle(
                            AppTextStyle.bodyRegular,
                            AppThemeColor.black.color,
                          ),
                        ),
                        SvgPicture.asset(
                          Assets.icons.allyBlueIcon,
                          width: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'を',
                                style: textStyle(
                                  AppTextStyle.bodyRegular,
                                  AppThemeColor.black.color,
                                ),
                              ),
                              TextSpan(
                                text: '4つ全て',
                                style: textStyle(
                                  AppTextStyle.bodyBold,
                                  AppThemeColor.black.color,
                                ),
                              ),
                              TextSpan(
                                text: '獲る',
                                style: textStyle(
                                  AppTextStyle.bodyRegular,
                                  AppThemeColor.black.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '2. 自分の',
                          style: textStyle(
                            AppTextStyle.bodyRegular,
                            AppThemeColor.black.color,
                          ),
                        ),
                        SvgPicture.asset(
                          Assets.icons.allyRedIcon,
                          width: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'を',
                                style: textStyle(
                                  AppTextStyle.bodyRegular,
                                  AppThemeColor.black.color,
                                ),
                              ),
                              TextSpan(
                                text: '4つ全て',
                                style: textStyle(
                                  AppTextStyle.bodyBold,
                                  AppThemeColor.black.color,
                                ),
                              ),
                              TextSpan(
                                text: '相手に獲らせる',
                                style: textStyle(
                                  AppTextStyle.bodyRegular,
                                  AppThemeColor.black.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '3. 自分の',
                          style: textStyle(
                            AppTextStyle.bodyRegular,
                            AppThemeColor.black.color,
                          ),
                        ),
                        SvgPicture.asset(
                          Assets.icons.allyBlueIcon,
                          width: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'でボードから',
                                style: textStyle(
                                  AppTextStyle.bodyRegular,
                                  AppThemeColor.black.color,
                                ),
                              ),
                              TextSpan(
                                text: '脱出',
                                style: textStyle(
                                  AppTextStyle.bodyBold,
                                  AppThemeColor.black.color,
                                ),
                              ),
                              TextSpan(
                                text: 'して',
                                style: textStyle(
                                  AppTextStyle.bodyRegular,
                                  AppThemeColor.black.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          Assets.icons.goalIcon,
                          width: 20,
                          colorFilter: ColorFilter.mode(
                            AppThemeColor.accentYellow.color,
                            BlendMode.srcATop,
                          ),
                        ),
                        Text(
                          'を獲る',
                          style: textStyle(
                            AppTextStyle.bodyRegular,
                            AppThemeColor.black.color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppThemeColor.black.color,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  'ゲームの流れ',
                  style: textStyle(
                    AppTextStyle.bodyBold,
                    AppThemeColor.black.color,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '・',
                          style: textStyle(
                            AppTextStyle.bodyRegular,
                            AppThemeColor.black.color,
                          ),
                        ),
                        SvgPicture.asset(
                          Assets.icons.allyBlueIcon,
                          width: 20,
                        ),
                        Text(
                          'と',
                          style: textStyle(
                            AppTextStyle.bodyRegular,
                            AppThemeColor.black.color,
                          ),
                        ),
                        SvgPicture.asset(
                          Assets.icons.allyRedIcon,
                          width: 20,
                        ),
                        Text(
                          'を4体ずつ配置します',
                          style: textStyle(
                            AppTextStyle.bodyRegular,
                            AppThemeColor.black.color,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '　(コマの配置は相手にはわかりません)',
                      style: textStyle(
                        AppTextStyle.bodyRegular,
                        AppThemeColor.black.color,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '・各プレイヤーは自分のターンに',
                              style: textStyle(
                                AppTextStyle.bodyRegular,
                                AppThemeColor.black.color,
                              ),
                            ),
                            SvgPicture.asset(
                              Assets.icons.allyBlueIcon,
                              width: 20,
                            ),
                            Text(
                              'か',
                              style: textStyle(
                                AppTextStyle.bodyRegular,
                                AppThemeColor.black.color,
                              ),
                            ),
                            SvgPicture.asset(
                              Assets.icons.allyRedIcon,
                              width: 20,
                            ),
                            Text(
                              'を',
                              style: textStyle(
                                AppTextStyle.bodyRegular,
                                AppThemeColor.black.color,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '　縦・横のいずれかの方向に1マス進めます',
                          style: textStyle(
                            AppTextStyle.bodyRegular,
                            AppThemeColor.black.color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '・進む方向に',
                          style: textStyle(
                            AppTextStyle.bodyRegular,
                            AppThemeColor.black.color,
                          ),
                        ),
                        SvgPicture.asset(
                          Assets.icons.enemyIcon,
                          width: 20,
                        ),
                        Text(
                          'があれば獲ることができます',
                          style: textStyle(
                            AppTextStyle.bodyRegular,
                            AppThemeColor.black.color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            '以上がゲームのルールです',
            style: textStyle(
              AppTextStyle.bodyRegular,
              AppThemeColor.black.color,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '相手コマの色を推理して勝利を目指しましょう！',
            style: textStyle(
              AppTextStyle.bodyRegular,
              AppThemeColor.black.color,
            ),
          ),
        ],
      ),
    );
  }
}
