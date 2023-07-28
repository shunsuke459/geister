import 'package:flutter/material.dart';
import 'package:geister/theme/app_text_style.dart';
import 'package:geister/theme/app_theme_color.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: textStyle(
            AppTextStyle.titleRegular,
            AppThemeColor.black.color,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              'プライバシーポリシー',
              style: textStyle(
                AppTextStyle.bodyBold,
                AppThemeColor.black.color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Fantasmiアプリ（以下、本アプリ）は無料アプリです。本アプリは無償で提供されるものであり、そのままご利用いただけます。',
              style: textStyle(
                AppTextStyle.captionRegular,
                AppThemeColor.black.color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '本ページは本アプリを利用される方に、個人情報の収集、利用、開示に関する方針をお知らせするためのものです。',
              style: textStyle(
                AppTextStyle.captionRegular,
                AppThemeColor.black.color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '本アプリを利用される場合、利用者はこの方針に関する情報の収集と使用に同意します。\n収集した個人情報は本アプリの提供及び改善に使用し、本プライバシーポリシーに記載されている場合を除き、利用者の情報を使用または第三者と共有することはありません。',
              style: textStyle(
                AppTextStyle.captionRegular,
                AppThemeColor.black.color,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '情報の収集と利用',
              style: textStyle(
                AppTextStyle.bodyBold,
                AppThemeColor.black.color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '本アプリで利用者が任意に設定したユーザー名、ゲームの勝敗などのデータは同アプリ内で対戦成績として第三者へ提供されます。その他の目的には一切使用されることはありません。',
              style: textStyle(
                AppTextStyle.captionRegular,
                AppThemeColor.black.color,
              ),
            ),
            Text(
              '',
              style: textStyle(
                AppTextStyle.captionRegular,
                AppThemeColor.black.color,
              ),
            ),
            Text(
              '',
              style: textStyle(
                AppTextStyle.captionRegular,
                AppThemeColor.black.color,
              ),
            ),
            Text(
              '',
              style: textStyle(
                AppTextStyle.bodyRegular,
                AppThemeColor.black.color,
              ),
            ),
            Text(
              '',
              style: textStyle(
                AppTextStyle.bodyRegular,
                AppThemeColor.black.color,
              ),
            ),
            Text(
              '',
              style: textStyle(
                AppTextStyle.bodyRegular,
                AppThemeColor.black.color,
              ),
            ),
            Text(
              '',
              style: textStyle(
                AppTextStyle.bodyRegular,
                AppThemeColor.black.color,
              ),
            ),
            Text(
              '',
              style: textStyle(
                AppTextStyle.bodyRegular,
                AppThemeColor.black.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
